# Qoder Plugin Setup

## 与 Ponytail 的对比

Ponytail 的 Qoder 支持主要由三部分组成：

- `AGENTS.md`：Qoder 从仓库根目录自动读取，作为 always-on context
- `.qoder/rules/ponytail.md`：复制到业务项目 `.qoder/rules/` 后作为项目规则
- `.qoder-plugin/plugin.json`：指向 `skills/`，让 Qoder Skill 系统识别技能

本框架对应结构：

```text
AGENTS.md
.qoder-plugin/plugin.json
.qoder/rules/enterprise-ai-framework.md
skills/
```

因此，本框架已经具备 Qoder 识别所需的基础结构。

## 场景一：在框架仓库本身使用 Qoder

如果你直接用 Qoder 打开本框架仓库，Qoder 应优先读取：

```text
AGENTS.md
.qoder-plugin/plugin.json
.qoder/rules/enterprise-ai-framework.md
skills/
```

然后可以测试：

```text
INIT
```

如果 Qoder 的 Skill 列表中出现本框架相关技能，说明插件层已识别。

## 场景二：在实际业务项目中使用 Qoder

如果你的业务项目中已经有：

```text
your-business-project/
├── ai-framework/
├── .agent/
└── 项目代码
```

还需要把规则复制到业务项目：

```bash
mkdir -p .qoder/rules
cp ai-framework/.qoder/rules/enterprise-ai-framework.md .qoder/rules/
```

建议业务项目保留一个简短的 `AGENTS.md`，用于记录项目特殊规则。

## 场景三：不想在业务项目放 ai-framework

如果 Qoder 已经安装或识别本插件，业务项目不一定需要 `ai-framework/`。

但第一次生成 `.agent/` 上下文时，仍然需要执行扫描脚本，可以使用框架仓库的绝对路径：

```bash
bash /path/to/enterprise-ai-framework/scripts/scan_project.sh . --write
```

业务项目中保留：

```text
.agent/
.qoder/rules/enterprise-ai-framework.md
AGENTS.md
```

`.agent/` 必须加入业务项目 `.gitignore`。

## 如何判断 Qoder 是否识别

新开 Qoder 会话后输入：

```text
INIT
```

如果它知道需要读取 `.agent/`，并且能识别：

```text
API_DOC
LOGIC
BUG
FEATURE
REVIEW
FRONTEND
SQL_REVIEW
PROJECT_SCAN
```

说明 Qoder 规则已经生效。

如果 Qoder 提供 Skill 列表或插件列表，确认其中出现：

```text
enterprise-ai-framework
api-documentation
existing-logic-analysis
feature-development
code-review
project-scan
```

则说明插件技能也已识别。

## Full Plugin Tier

Ponytail 还提供 hooks，用于每次 Prompt 自动注入规则。

本框架当前不强制依赖 hooks，因为 `.qoder/rules/enterprise-ai-framework.md` 和 `AGENTS.md` 已覆盖常规使用。

未来可以追加：

```text
hooks/qoder-hooks.json
.qoder/settings.json
```

用于实现每次 prompt 自动注入 `.agent/` 上下文和框架规则。

## 推荐操作

实际业务项目中最稳的 Qoder 接入方式：

```bash
mkdir -p .qoder/rules
cp ai-framework/.qoder/rules/enterprise-ai-framework.md .qoder/rules/
bash ai-framework/scripts/scan_project.sh . --write
```

然后新开 Qoder 会话输入：

```text
INIT
```

之后使用：

```text
API_DOC DiyController.php
LOGIC DiyController.php
BUG 会员同步失败
```
