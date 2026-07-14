# Codex And Qoder Plugin Usage

## 说明

本项目现在同时提供两种使用方式：

- 项目内规则模式：`AGENTS.md` + `ai-framework/` + `.agent/`
- 插件模式：Codex / Qoder 读取插件入口、技能和规则

插件模式适合减少每次新会话手动输入初始化提示词的问题。

## Codex 插件入口

Codex 插件入口：

```text
.codex-plugin/plugin.json
skills/
```

插件名称：

```text
enterprise-ai-framework
```

当前提供的 Codex Skills：

- `enterprise-ai-framework`
- `api-documentation`
- `existing-logic-analysis`
- `bug-fix`
- `feature-development`
- `code-review`
- `frontend-implementation`
- `sql-review`
- `project-scan`

## Qoder 插件入口

Qoder 插件入口：

```text
.qoder-plugin/plugin.json
.qoder/rules/enterprise-ai-framework.md
skills/
```

Qoder 会读取规则文件，并按快捷指令路由到对应能力。

## 快捷指令

插件模式和项目内规则模式都支持以下快捷指令：

```text
INIT
API_DOC DiyController.php
LOGIC DiyController.php
BUG 会员同步失败
FEATURE 新增优惠券领取接口
REVIEW SaleOrderReturn.php
FRONTEND 修改自定义首页样式
SQL_REVIEW 订单列表查询
PROJECT_SCAN
```

## 与 `.agent/` 的关系

插件负责提供能力和规则，`.agent/` 负责保存具体业务项目的上下文。

第一次进入实际业务项目时，仍然建议执行：

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

生成：

```text
.agent/context.md
.agent/runtime.md
.agent/structure.md
.agent/context.json
```

之后插件技能会优先复用这些上下文，而不是每次重新扫描项目。

## 使用建议

### Codex

如果 Codex 已安装本插件，新会话可以直接输入：

```text
INIT
```

然后继续输入：

```text
API_DOC DiyController.php
```

### Qoder

如果 Qoder 已识别本插件或规则文件，新会话可以直接输入：

```text
INIT
```

然后继续输入：

```text
LOGIC DiyController.php
```

## 注意事项

- 插件模式不替代项目扫描
- 插件模式不代表可以跳过版本兼容检查
- 用户只要求文档、分析或评审时，不得修改代码
- 不确定的信息仍然必须标记为“需确认”

## TODO

- Future: Codex marketplace packaging
- Future: Qoder official marketplace packaging
- Future: Plugin icon and screenshots
- Future: Hook-based automatic project context loading
