# ShortcutCommands

## 说明

快捷指令用于在尚未封装成 Codex Plugin 的情况下，提供接近 `/skill` 的使用体验。

用户只需要输入短命令和目标文件、模块或问题描述，Agent 就应自动路由到对应 Workflow、Skill 和 Template。

## 使用原则

- 快捷指令只负责路由，不降低质量标准
- 快捷指令不能绕过 `AGENTS.md`、`.agent/` 项目上下文和版本约束
- 如果目标文件、模块或问题描述不清楚，必须先澄清
- 如果用户要求“只分析”或“只输出文档”，不得修改代码
- 如果命令涉及代码修改，仍需遵守先分析、再设计、再实现、再测试、再总结的闭环

## 指令总览

| 指令 | 场景 | 默认 Workflow | 核心 Skill | 默认是否修改代码 |
|---|---|---|---|---|
| `INIT` | 初始化当前会话上下文 | Context Initialization | `enterprise-ai-framework` | 否 |
| `API_DOC` | 生成接口文档 | `ApiDevelopment` | `ApiDocumentation` | 否 |
| `LOGIC` | 确认现有功能逻辑 | `ExistingLogicConfirmation` | `ExistingLogicAnalysis` | 否 |
| `BUG` | 排查或修复问题 | `BugFix` | `Debugging` | 视用户要求 |
| `FEATURE` | 新增功能 | `FeatureDevelopment` | `RequirementAnalysis` | 是 |
| `REVIEW` | 代码评审 | `CodeReview` | `CodeReview` | 否 |
| `FRONTEND` | 前端页面、样式、交互修改 | `FrontendImplementation` | `FrontendImplementation` | 视用户要求 |
| `SQL_REVIEW` | SQL 或数据库风险审查 | `DatabaseMigration` | `RiskAnalysis` | 否 |
| `PROJECT_SCAN` | 重新扫描项目结构 | Project Scan | Project Context | 生成 `.agent/` |

## 指令格式

### INIT

```text
INIT
```

含义：

- 读取 `AGENTS.md`
- 读取 `.agent/context.md`
- 读取 `.agent/runtime.md`
- 读取 `.agent/structure.md`
- 如果存在，读取 `.agent/context.json`
- 本会话后续复用这些上下文
- 不重复全量扫描项目

默认输出：

- 识别到的运行环境
- 推荐 Profile
- 已加载的项目上下文
- 可用快捷指令

### API_DOC

```text
API_DOC DiyController.php
```

含义：

- 只分析指定控制器及直接相关依赖
- 不修改代码
- 输出 Markdown 接口文档
- 无法确认的信息标记为“需确认”

默认输出：

- 控制器说明
- 接口列表
- 请求方式
- 请求路径
- 请求参数表
- 返回字段表
- 返回示例
- 错误场景
- 依赖的 Service / Model
- 待确认问题

### LOGIC

```text
LOGIC DiyController.php
```

含义：

- 分析指定文件、模块或功能的现有逻辑
- 不修改代码
- 输出功能流程、调用链、数据流、关键判断和风险

默认输出：

- 功能概述
- 调用入口
- 调用链路
- 数据读取和写入
- 关键业务规则
- 可能存在的问题
- 待确认问题

### BUG

```text
BUG 会员同步失败
```

含义：

- 先定位问题范围和可能原因
- 优先输出根因分析和影响范围
- 是否修改代码取决于用户是否明确要求

默认输出：

- 问题现象
- 影响范围
- 排查路径
- 可能根因
- 验证方式
- 修复建议
- 回归测试建议

### FEATURE

```text
FEATURE 新增优惠券领取接口
```

含义：

- 按完整 FeatureDevelopment Workflow 执行
- 先输出需求分析、技术方案、风险分析和任务拆分
- 用户确认后再实现代码

默认输出：

- RequirementAnalysis
- TechnicalDesign
- RiskAnalysis
- TaskBreakdown
- CodeGeneration
- UnitTesting
- CodeReview
- ApiDocumentation
- ChangeSummary

### REVIEW

```text
REVIEW DiyController.php
```

含义：

- 审查指定文件、模块或变更
- 不修改代码
- 优先关注正确性、兼容性、安全、性能、SQL、Redis、日志、异常和测试缺口

默认输出：

- 问题列表
- 风险等级
- 位置说明
- 修改建议
- 是否阻塞上线

### FRONTEND

```text
FRONTEND 修改自定义首页样式
```

含义：

- 处理 HTML、CSS、JavaScript、模板、组件或页面交互
- 优先复用现有组件、样式、工具函数和交互逻辑
- 不得随意引入新框架、新构建工具或新依赖
- 样式优先写入现有样式文件，不直接写在 HTML 中

默认输出：

- 现有页面结构
- 影响范围
- 实现方案
- 兼容性风险
- 修改点
- 测试建议

### SQL_REVIEW

```text
SQL_REVIEW SaleOrderReturn.php
```

含义：

- 审查指定文件、SQL、查询链路或数据库变更
- 不修改代码
- 重点检查索引、全表扫描、分页、锁、事务、死锁、大表、SQL 注入和兼容性

默认输出：

- SQL 列表
- 风险点
- 索引建议
- 事务和锁风险
- 优化建议
- 待确认问题

### PROJECT_SCAN

```text
PROJECT_SCAN
```

含义：

- 用户主动要求重新扫描项目结构
- 可执行 `bash ai-framework/scripts/scan_project.sh . --write`
- 刷新 `.agent/` 项目上下文

## 未识别指令

如果用户输入类似短命令但无法识别：

- 不要猜测
- 先询问用户意图
- 可以列出当前支持的快捷指令

## TODO

- Future: Codex Plugin slash command
- Future: Qoder command palette integration
- Future: PhpStorm Live Template examples
- Future: command aliases in Chinese
