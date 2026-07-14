#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

warn() {
  printf 'WARN: %s\n' "$1" >&2
}

required_paths=(
  "README.md"
  "AGENTS.md"
  "VERSION"
  ".agents/plugins/marketplace.json"
  ".codex-plugin/plugin.json"
  ".qoder-plugin/plugin.json"
  ".qoder/rules/enterprise-ai-framework.md"
  ".qoder/settings.example.json"
  "hooks/qoder-hooks.json"
  "hooks/enterprise-ai-framework-instructions.js"
  "config/framework.json"
  "schemas/project-context.schema.json"
  "scripts/scan_project.sh"
  "Standards/README.md"
  "Roles/README.md"
  "Runtimes/README.md"
  "Runtimes/PHP/PHP5.4/README.md"
  "Runtimes/PHP/PHP7.2/README.md"
  "Runtimes/PHP/PHP7.4/README.md"
  "Runtimes/Frameworks/ThinkPHP3/README.md"
  "Runtimes/Frameworks/ThinkPHP5.1/README.md"
  "Runtimes/Frontend/HTML/README.md"
  "Runtimes/Frontend/CSS/README.md"
  "Runtimes/Frontend/JavaScript/README.md"
  "ProjectTypes/README.md"
  "Profiles/README.md"
  "Profiles/HTML-CSS-JavaScript.md"
  "skills/README.md"
  "Workflows/README.md"
  "Templates/README.md"
  "Orchestrator/README.md"
  "Orchestrator/CachePolicy.md"
  "Orchestrator/ProjectScanPolicy.md"
  "Orchestrator/RoleSelectionPolicy.md"
  "Orchestrator/ShortcutCommands.md"
  "Orchestrator/StandardSkillMatrix.md"
  "Orchestrator/SkillTemplateMatrix.md"
  "Orchestrator/ProjectTypeWorkflowMatrix.md"
  "Orchestrator/ProfileSkillPriorityMatrix.md"
  "Orchestrator/WorkflowTemplateMatrix.md"
  "Templates/ProjectContext/README.md"
  "docs/usage/examples/AGENTS.example.md"
  "docs/usage/Codex-And-Qoder-Plugin.md"
  "docs/usage/Qoder-Plugin-Setup.md"
  "docs/usage/examples/PHP7.2-ThinkPHP5.1-Project.md"
  "skills/enterprise-ai-framework/SKILL.md"
  "skills/ApiDocumentation/SKILL.md"
  "skills/ExistingLogicAnalysis/SKILL.md"
  "skills/CodeReview/SKILL.md"
  "skills/FrontendImplementation/SKILL.md"
  "skills/enterprise-ai-framework/SKILL.md"
  "skills/bug-fix/SKILL.md"
  "skills/feature-development/SKILL.md"
  "skills/sql-review/SKILL.md"
  "skills/project-scan/SKILL.md"
)

for path in "${required_paths[@]}"; do
  [[ -e "$path" ]] || fail "missing required path: $path"
done

if command -v ruby >/dev/null 2>&1; then
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' config/framework.json || fail "invalid JSON: config/framework.json"
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' schemas/project-context.schema.json || fail "invalid JSON: schemas/project-context.schema.json"
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' .agents/plugins/marketplace.json || fail "invalid JSON: .agents/plugins/marketplace.json"
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' .codex-plugin/plugin.json || fail "invalid JSON: .codex-plugin/plugin.json"
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' .qoder-plugin/plugin.json || fail "invalid JSON: .qoder-plugin/plugin.json"
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' hooks/qoder-hooks.json || fail "invalid JSON: hooks/qoder-hooks.json"
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' .qoder/settings.example.json || fail "invalid JSON: .qoder/settings.example.json"
else
  warn "ruby not found; skipped JSON validation"
fi

framework_version="$(tr -d '[:space:]' < VERSION)"
codex_version="$(ruby -rjson -e 'print JSON.parse(File.read(".codex-plugin/plugin.json")).fetch("version")' 2>/dev/null || true)"
qoder_version="$(ruby -rjson -e 'print JSON.parse(File.read(".qoder-plugin/plugin.json")).fetch("version")' 2>/dev/null || true)"
[[ -z "$codex_version" || "$codex_version" == "$framework_version" ]] || fail "Codex plugin version does not match VERSION"
[[ -z "$qoder_version" || "$qoder_version" == "$framework_version" ]] || fail "Qoder plugin version does not match VERSION"

codex_skills_path="$(ruby -rjson -e 'print JSON.parse(File.read(".codex-plugin/plugin.json")).fetch("skills")' 2>/dev/null || true)"
qoder_skills_path="$(ruby -rjson -e 'print JSON.parse(File.read(".qoder-plugin/plugin.json")).fetch("skills")' 2>/dev/null || true)"
[[ -z "$codex_skills_path" || "$codex_skills_path" == "./skills/" ]] || fail "Codex plugin skills path must be ./skills/"
[[ -z "$qoder_skills_path" || "$qoder_skills_path" == "./skills/" ]] || fail "Qoder plugin skills path must be ./skills/"

marketplace_plugin_name="$(ruby -rjson -e 'print JSON.parse(File.read(".agents/plugins/marketplace.json")).fetch("plugins").first.fetch("name")' 2>/dev/null || true)"
[[ -z "$marketplace_plugin_name" || "$marketplace_plugin_name" == "enterprise-ai-framework" ]] || fail "marketplace plugin name must be enterprise-ai-framework"

while IFS= read -r skill_file; do
  first_line="$(sed -n '1p' "$skill_file")"
  [[ "$first_line" == "---" ]] || fail "plugin skill missing YAML frontmatter: $skill_file"
  sed -n '2,30p' "$skill_file" | rg '^name:[[:space:]]*[a-z0-9-]+' >/dev/null || fail "plugin skill missing name: $skill_file"
  sed -n '2,30p' "$skill_file" | rg '^description:' >/dev/null || fail "plugin skill missing description: $skill_file"
done < <(find skills -mindepth 2 -maxdepth 2 -name 'SKILL.md' | sort)

bash -n scripts/scan_project.sh || fail "invalid shell syntax: scripts/scan_project.sh"
node --check hooks/enterprise-ai-framework-instructions.js || fail "invalid JS syntax: hooks/enterprise-ai-framework-instructions.js"

scan_tmp="$(mktemp -d)"
trap 'rm -rf "$scan_tmp"' EXIT
mkdir -p "$scan_tmp/application/index/controller" "$scan_tmp/public/static" "$scan_tmp/.idea"
printf '{"require":{"php":">=7.2"}}\n' > "$scan_tmp/composer.json"
touch "$scan_tmp/think" "$scan_tmp/.DS_Store"
bash scripts/scan_project.sh "$scan_tmp" --write >/tmp/eaisef-scan-smoke.txt

for path in context.md runtime.md structure.md context.json; do
  [[ -f "$scan_tmp/.agent/$path" ]] || fail "project scanner did not write .agent/$path"
done

if command -v ruby >/dev/null 2>&1; then
  ruby -rjson -e 'JSON.parse(File.read(ARGV[0]))' "$scan_tmp/.agent/context.json" || fail "project scanner wrote invalid context.json"
fi

if grep -Fx 'Application' "$scan_tmp/.agent/context.json" >/dev/null; then
  fail "project scanner matched Application when only application exists"
fi

if rg -nF "$ROOT_DIR" . --glob '!scripts/validate_repository.sh' >/tmp/eaisef-absolute-links.txt; then
  cat /tmp/eaisef-absolute-links.txt >&2
  fail "repository contains machine-specific absolute links"
fi

for ignored_path in ".agent" "work" "outputs" "node_modules" "vendor"; do
  rg -n "^${ignored_path}/$" .gitignore >/dev/null || fail ".gitignore must ignore ${ignored_path}/"
done

while IFS= read -r md_file; do
  first_line="$(sed -n '1p' "$md_file")"
  if [[ "$(basename "$md_file")" == "SKILL.md" ]]; then
    [[ "$first_line" == "---" ]] || fail "plugin skill must start with YAML frontmatter: $md_file"
    continue
  fi
  [[ "$first_line" == \#* ]] || fail "markdown file missing top-level heading: $md_file"
done < <(find . -type f -name '*.md' | sort)

while IFS=$'\t' read -r md_file line_no link_target; do
  case "$link_target" in
    http://*|https://*|mailto:*|\#*|"")
      continue
      ;;
  esac

  link_target="${link_target#<}"
  link_target="${link_target%>}"
  link_path="${link_target%%#*}"

  if [[ "$link_path" = /* ]]; then
    fail "markdown file contains non-portable absolute link: $md_file:$line_no -> $link_target"
  fi

  if [[ -n "$link_path" && ! -e "$(dirname "$md_file")/$link_path" ]]; then
    fail "markdown file contains broken relative link: $md_file:$line_no -> $link_target"
  fi
done < <(find . -type f -name '*.md' -print0 | xargs -0 perl -ne 'while (/\[[^\]]+\]\(([^)]+)\)/g) { print "$ARGV\t$.\t$1\n"; } close ARGV if eof')

ds_store_count="$(find . -name '.DS_Store' | wc -l | tr -d ' ')"
if [[ "$ds_store_count" != "0" ]]; then
  warn "found $ds_store_count .DS_Store file(s); ignored by .gitignore but should be deleted before publishing"
fi

idea_count="$(find . -path './.idea/*' | wc -l | tr -d ' ')"
if [[ "$idea_count" != "0" ]]; then
  warn "found $idea_count .idea file(s); ignored by .gitignore but should be deleted before publishing"
fi

printf 'Repository validation passed.\n'
printf 'Markdown files: %s\n' "$(find . -type f -name '*.md' | wc -l | tr -d ' ')"
printf 'Framework version: %s\n' "$(tr -d '[:space:]' < VERSION)"
