#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  bash scripts/scan_project.sh [project_root] [--write]

Description:
  Scan a real business project once and produce AI-readable project context.

Options:
  --write   Write .agent/context.md, .agent/runtime.md, .agent/structure.md, and .agent/context.json into the target project.

Default:
  Without --write, the script prints the scan result only and does not modify the target project.
USAGE
}

PROJECT_ROOT="."
WRITE_MODE="false"

for arg in "$@"; do
  case "$arg" in
    --write)
      WRITE_MODE="true"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      PROJECT_ROOT="$arg"
      ;;
  esac
done

PROJECT_ROOT="$(cd "$PROJECT_ROOT" && pwd)"
PROJECT_NAME="$(basename "$PROJECT_ROOT")"
GENERATED_AT="$(date '+%Y-%m-%d %H:%M:%S %z')"

detect_php() {
  if [[ -f "$PROJECT_ROOT/composer.json" ]]; then
    php_requirement="$(grep -E '"php"[[:space:]]*:' "$PROJECT_ROOT/composer.json" | head -n 1 | sed -E 's/.*"php"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/' || true)"
    if [[ -n "${php_requirement:-}" && "$php_requirement" != *'"php"'* ]]; then
      printf '%s' "$php_requirement"
      return
    fi
  fi

  if [[ -f "$PROJECT_ROOT/Dockerfile" ]]; then
    docker_php="$(grep -Eio 'php:([0-9]+\.[0-9]+)' "$PROJECT_ROOT/Dockerfile" | head -n 1 | cut -d: -f2 || true)"
    if [[ -n "${docker_php:-}" ]]; then
      printf '%s' "$docker_php"
      return
    fi
  fi

  printf '未确认'
}

detect_framework() {
  if path_exists_exact "ThinkPHP/ThinkPHP.php"; then
    printf 'ThinkPHP3'
    return
  fi

  if path_exists_exact "vendor/topthink/framework" || path_exists_exact "think"; then
    printf 'ThinkPHP5.1 或相近版本，需结合 composer.lock 确认'
    return
  fi

  printf '未确认'
}

detect_frontend() {
  if path_exists_exact "package.json"; then
    printf '检测到 package.json，存在前端构建或 Node.js 工具链'
    return
  fi

  if path_exists_exact "public" || path_exists_exact "assets" || path_exists_exact "static"; then
    printf '检测到静态资源目录'
    return
  fi

  printf '未确认'
}

list_root_files() {
  find "$PROJECT_ROOT" -maxdepth 1 -type f ! -name '.DS_Store' -print | sed "s#^$PROJECT_ROOT/##" | sort | head -n 80
}

list_directories() {
  find "$PROJECT_ROOT" -mindepth 1 -maxdepth 2 -type d \
    ! -path "$PROJECT_ROOT/.git" \
    ! -path "$PROJECT_ROOT/.git/*" \
    ! -path "$PROJECT_ROOT/.agent" \
    ! -path "$PROJECT_ROOT/.agent/*" \
    ! -path "$PROJECT_ROOT/.idea" \
    ! -path "$PROJECT_ROOT/.idea/*" \
    ! -path "$PROJECT_ROOT/ai-framework" \
    ! -path "$PROJECT_ROOT/ai-framework/*" \
    ! -path "$PROJECT_ROOT/vendor/*" \
    ! -path "$PROJECT_ROOT/node_modules/*" \
    -print | sed "s#^$PROJECT_ROOT##; s#^/##" | sort | head -n 120
}

path_exists_exact() {
  local relative_path="$1"
  local current="$PROJECT_ROOT"
  local part
  local old_ifs="$IFS"

  IFS='/'
  for part in $relative_path; do
    IFS="$old_ifs"
    [[ -d "$current" ]] || return 1
    ls -1A "$current" 2>/dev/null | grep -Fx -- "$part" >/dev/null || return 1
    current="$current/$part"
    IFS='/'
  done

  IFS="$old_ifs"
  [[ -e "$current" ]]
}

important_paths() {
  for path in \
    AGENTS.md \
    composer.json \
    composer.lock \
    package.json \
    Dockerfile \
    docker-compose.yml \
    ThinkPHP/ThinkPHP.php \
    think \
    application \
    Application \
    vendor/topthink/framework \
    public \
    assets \
    static \
    src \
    docs
  do
    if path_exists_exact "$path"; then
      printf '%s\n' "$path"
    fi
  done
}

json_escape() {
  sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'
}

json_array() {
  local first="true"
  printf '['
  while IFS= read -r item; do
    [[ -z "$item" ]] && continue
    if [[ "$first" == "true" ]]; then
      first="false"
    else
      printf ', '
    fi
    printf '"%s"' "$(printf '%s' "$item" | json_escape)"
  done
  printf ']'
}

PHP_VERSION="$(detect_php)"
FRAMEWORK_VERSION="$(detect_framework)"
FRONTEND_STATUS="$(detect_frontend)"

render_context() {
  cat <<EOF
# Project Context

## 项目

- 项目名称：$PROJECT_NAME
- 项目路径：$PROJECT_ROOT
- 生成时间：$GENERATED_AT

## 初步判断

- PHP：$PHP_VERSION
- Framework：$FRAMEWORK_VERSION
- Frontend：$FRONTEND_STATUS

## 使用规则

- 后续任务默认复用本上下文，不重复全量扫描。
- 如果用户要求重新扫描，或项目结构、运行环境、核心配置发生变化，需要刷新本上下文。
- 未确认的版本不得作为事实使用，必须在任务中继续查证。
EOF
}

render_runtime() {
  cat <<EOF
# Project Runtime

## 运行环境

- PHP：$PHP_VERSION
- Framework：$FRAMEWORK_VERSION
- Frontend：$FRONTEND_STATUS
- Composer：$([[ -f "$PROJECT_ROOT/composer.json" ]] && printf '是' || printf '否')
- Node.js 工具链：$([[ -f "$PROJECT_ROOT/package.json" ]] && printf '是' || printf '否')

## 兼容性要求

- 生成代码前必须确认实际运行版本。
- 不得在 PHP 5.4 项目中使用 PHP 7.x 或 PHP 8.x 语法。
- 不得在 ThinkPHP3 项目中套用 ThinkPHP5.1、ThinkPHP6 或更高版本写法。
- 不得在未确认前端构建链路时引入新的构建工具或依赖。
EOF
}

render_structure() {
  cat <<EOF
# Project Structure

## 根目录文件

$(list_root_files | sed 's/^/- /')

## 目录结构

$(list_directories | sed 's/^/- /')

## 重要路径

$(important_paths | sed 's/^/- /')

## 后续阅读建议

- 优先读取与当前任务直接相关的 Controller、Service、Model、Repository、模板、组件或静态资源。
- 优先复用现有实现，不要重复造轮子。
- 不要为了单个需求全量读取无关模块。
EOF
}

render_json() {
  local composer_enabled="false"
  local node_enabled="false"

  [[ -f "$PROJECT_ROOT/composer.json" ]] && composer_enabled="true"
  [[ -f "$PROJECT_ROOT/package.json" ]] && node_enabled="true"

  cat <<EOF
{
  "schemaVersion": "1.0",
  "generatedBy": "Enterprise AI Software Engineering Framework",
  "generatedAt": "$(printf '%s' "$GENERATED_AT" | json_escape)",
  "project": {
    "root": "$(printf '%s' "$PROJECT_ROOT" | json_escape)",
    "name": "$(printf '%s' "$PROJECT_NAME" | json_escape)"
  },
  "runtime": {
    "php": "$(printf '%s' "$PHP_VERSION" | json_escape)",
    "framework": "$(printf '%s' "$FRAMEWORK_VERSION" | json_escape)",
    "frontend": "$(printf '%s' "$FRONTEND_STATUS" | json_escape)",
    "composer": $composer_enabled,
    "node": $node_enabled
  },
  "structure": {
    "rootFiles": $(list_root_files | json_array),
    "directories": $(list_directories | json_array),
    "importantPaths": $(important_paths | json_array)
  },
  "notes": [
    "后续任务默认复用本上下文，不重复全量扫描。",
    "未确认的版本不得作为事实使用，必须在任务中继续查证。",
    "如果用户要求重新扫描，或项目结构、运行环境、核心配置发生变化，需要刷新本上下文。"
  ]
}
EOF
}

if [[ "$WRITE_MODE" == "true" ]]; then
  mkdir -p "$PROJECT_ROOT/.agent"
  render_context > "$PROJECT_ROOT/.agent/context.md"
  render_runtime > "$PROJECT_ROOT/.agent/runtime.md"
  render_structure > "$PROJECT_ROOT/.agent/structure.md"
  render_json > "$PROJECT_ROOT/.agent/context.json"
  printf 'Project context written to %s/.agent\n' "$PROJECT_ROOT"
else
  render_context
  printf '\n---\n\n'
  render_runtime
  printf '\n---\n\n'
  render_structure
fi
