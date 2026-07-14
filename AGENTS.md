# AGENTS.md

## 说明

本仓库是 Enterprise AI Software Engineering Framework。

Qoder、Codex 或其他 Agent 进入本仓库时，应优先读取本文件，并按本仓库的框架规则工作。

## 仓库能力

本仓库同时支持：

- 文档规则模式
- Codex Plugin 模式
- Qoder Plugin 模式

关键入口：

- `.codex-plugin/plugin.json`
- `.qoder-plugin/plugin.json`
- `.qoder/rules/enterprise-ai-framework.md`
- `skills/`
- `scripts/scan_project.sh`
- `docs/usage/`

## 工作规则

- 修改前先阅读相关文档和现有结构
- 保持最小必要改动
- 不要破坏 Codex / Qoder 插件入口
- 不要把 `.agent/`、`work/`、`outputs/`、`.DS_Store`、`.idea/` 提交到仓库
- 修改插件 manifest、skills 或 Qoder 规则后，必须执行 `bash scripts/validate_repository.sh`
- 插件技能文件 `SKILL.md` 必须以 YAML frontmatter 开头

## 快捷指令

本仓库支持以下语义：

- `INIT`
- `API_DOC`
- `LOGIC`
- `BUG`
- `FEATURE`
- `REVIEW`
- `FRONTEND`
- `SQL_REVIEW`
- `PROJECT_SCAN`

## 验证命令

```bash
bash scripts/validate_repository.sh
```
