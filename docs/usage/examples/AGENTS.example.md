# AGENTS.md

## 使用说明

如果业务项目中本框架目录名就是 `ai-framework/`，可以将本文件复制到业务项目根目录并改名为 `AGENTS.md` 后直接使用。

如果框架目录名不是 `ai-framework/`，需要先替换本文档中的框架路径。

## 直接使用检查清单

- 项目根目录存在 `ai-framework/`
- `ai-framework/VERSION` 存在
- 项目根目录允许创建 `.agent/`
- 当前项目属于 PHP / ThinkPHP 技术栈
- 当前项目版本能匹配 `PHP5.4-ThinkPHP3`、`PHP7.2-ThinkPHP5.1` 或 `PHP7.4-ThinkPHP5.1`

如果以上任一条件不满足，需要先调整本文件再使用。

## 项目 AI 工作规则

本项目使用 `ai-framework/` 作为 AI 软件工程框架。

Agent 在处理任何需求前，必须先遵守以下规则。

## 框架位置

```text
ai-framework/
```

## 加载规则

1. 先读取 `ai-framework/VERSION`
2. 如果版本未变化，不要重复完整加载框架内容
3. 只按当前任务加载必要的 Roles、Standards、Profile、Skills、Workflows、Templates 和 Orchestrator 矩阵
4. 如果 `VERSION` 变化，需要刷新框架缓存

## 项目结构扫描规则

第一次进入本项目时，必须读取项目结构并形成上下文缓存。

推荐缓存文件：

```text
.agent/context.md
.agent/runtime.md
.agent/structure.md
.agent/context.json
```

后续任务默认复用这些缓存。

如果 `.agent/context.json` 存在，自动化工具可以优先读取 JSON；Agent 和开发者仍然需要参考 Markdown 产物中的说明。

除非用户主动要求，或项目结构、运行环境、关键配置发生变化，不要每次都全量扫描项目。

## 默认工作流

新增功能：

- 使用 `FeatureDevelopment`

缺陷修复：

- 使用 `BugFix`

确认现有逻辑：

- 使用 `ExistingLogicConfirmation`

接口开发：

- 使用 `ApiDevelopment`

前端页面修改：

- 使用 `FrontendImplementation`

数据库迁移：

- 使用 `DatabaseMigration`

代码评审：

- 使用 `CodeReview`

## 快捷指令

用户可以使用短命令触发常见工作流，避免每次输入完整提示词。

支持的快捷指令：

| 指令 | 用途 | 默认行为 |
|---|---|---|
| `INIT` | 初始化当前会话上下文 | 读取项目规则和 `.agent/` 上下文 |
| `API_DOC 文件名` | 生成接口文档 | 只分析，不修改代码 |
| `LOGIC 文件名或功能` | 确认现有功能逻辑 | 输出逻辑说明和问题总结 |
| `BUG 问题描述` | 排查问题 | 先分析根因，是否修改取决于用户要求 |
| `FEATURE 需求描述` | 新增功能 | 先分析、设计、评估风险，再实现 |
| `REVIEW 文件名或变更` | 代码评审 | 只输出评审结果，不修改代码 |
| `FRONTEND 页面或需求` | 前端修改 | 复用现有结构，注意兼容性 |
| `SQL_REVIEW 文件名或 SQL` | SQL 审查 | 只输出风险和优化建议 |
| `PROJECT_SCAN` | 重新扫描项目 | 刷新 `.agent/` 上下文 |

执行快捷指令时，仍然必须遵守：

- 先读取 `.agent/` 项目上下文
- 不重复全量扫描项目
- 不重复完整加载 `ai-framework/`
- 不绕过版本兼容约束
- 不确定的信息必须标记为“需确认”

示例：

```text
INIT
API_DOC DiyController.php
LOGIC 会员自动同步逻辑
BUG 订单退款状态异常
FEATURE 新增优惠券领取接口
REVIEW SaleOrderReturn.php
FRONTEND 修改自定义首页样式
SQL_REVIEW 订单列表查询
```

## Profile 选择

如果项目环境是 PHP 5.4 + ThinkPHP 3：

- 使用 `PHP5.4-ThinkPHP3`

如果项目环境是 PHP 7.2 + ThinkPHP 5.1：

- 使用 `PHP7.2-ThinkPHP5.1`

如果项目环境是 PHP 7.4 + ThinkPHP 5.1：

- 使用 `PHP7.4-ThinkPHP5.1`

如果无法确认 PHP 或 ThinkPHP 版本，必须先询问用户，不要猜测。

## 输出规则

分析现有功能或排查问题时，优先输出：

- `ExistingLogicAnalysis`

新增或修改接口时，必须输出：

- `ApiDocumentation`
- `ChangeSummary`

涉及风险、数据迁移、支付、库存、金额或订单状态时，必须输出：

- `RiskAnalysis`

## 禁止事项

- 不要在未确认版本时使用高版本 PHP 语法
- 不要在未确认框架版本时使用不兼容的 ThinkPHP API
- 不要每次任务都全量加载 `ai-framework/`
- 不要每次任务都全量扫描业务项目
- 不要在未确认现有逻辑前直接修改核心代码
