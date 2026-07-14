# RoutingPolicy

## 说明

路由策略决定当前任务应该进入哪个工作流，以及需要加载哪些标准、Profile、Skills 和 Templates。

## 路由输入

- 用户目标
- 识别出的角色
- 识别出的运行环境
- 识别出的项目类型
- 现有上下文
- 可用模板

## 路由原则

- 先文档后代码
- 先分析后实现
- 先设计后修改
- 先复用后新增
- 先最小变更后扩展

## 常见路由

### ShortcutCommands

如果用户输入快捷指令，应先按 `ShortcutCommands.md` 路由。

示例：

- `API_DOC DiyController.php` -> `ApiDevelopment` + `ApiDocumentation`
- `LOGIC DiyController.php` -> `ExistingLogicConfirmation` + `ExistingLogicAnalysis`
- `BUG 会员同步失败` -> `BugFix` + `Debugging`
- `FEATURE 新增优惠券领取接口` -> `FeatureDevelopment`
- `REVIEW SaleOrderReturn.php` -> `CodeReview`
- `FRONTEND 修改自定义首页样式` -> `FrontendImplementation`
- `SQL_REVIEW 订单列表查询` -> `DatabaseMigration` + `RiskAnalysis`
- `PROJECT_SCAN` -> 重新生成 `.agent/` 项目上下文

快捷指令优先级高于自然语言意图识别，但低于用户本次明确补充的限制条件。

### FeatureDevelopment

触发条件：

- 新增功能
- 新增接口
- 新增业务流程

默认步骤：

1. RequirementAnalysis
2. TechnicalDesign
3. RiskAnalysis
4. TaskBreakdown
5. CodeGeneration
6. UnitTesting
7. CodeReview
8. ApiDocumentation
9. ChangeSummary

### BugFix

触发条件：

- 修复缺陷
- 解决线上问题
- 定位错误原因

默认步骤：

1. ExistingLogicAnalysis
2. Debugging
3. RiskAnalysis
4. CodeGeneration
5. UnitTesting
6. CodeReview
7. ChangeSummary

### ExistingLogicConfirmation

触发条件：

- 确认现有功能逻辑
- 梳理调用链
- 排查问题但暂不修改代码
- 输出功能说明或问题说明

默认步骤：

1. ExistingLogicAnalysis
2. RiskAnalysis
3. ChangeSummary

### CodeReview

触发条件：

- 需要审查提交
- 需要判断变更风险
- 需要给出修改建议

默认步骤：

1. 读取上下文
2. 审查代码
3. 汇总问题
4. 给出修改建议

### ApiDevelopment

触发条件：

- 接口设计
- 接口开发
- 接口补文档

默认步骤：

1. RequirementAnalysis
2. ApiDesign
3. CodeGeneration
4. UnitTesting
5. ApiDocumentation
6. ChangeSummary

### FrontendImplementation

触发条件：

- 修改 HTML 或模板页面
- 修改 CSS 样式
- 修改 JavaScript 交互
- 修改 Ajax 请求
- 修复页面展示或交互问题

默认步骤：

1. ExistingLogicAnalysis
2. FrontendImplementation
3. UnitTesting
4. CodeReview
5. ChangeSummary

### DatabaseMigration

触发条件：

- 新增表
- 调整字段
- 迁移数据
- 修改索引

默认步骤：

1. DatabaseDesign
2. RiskAnalysis
3. 迁移规划
4. 实施
5. 验证
6. ChangeSummary

## 输出要求

每次路由必须明确输出：

- 选中的 Workflow
- 加载的 Profile
- 使用的 Skills
- 需要的 Templates
- 是否需要用户确认

## 路由优先级

1. 用户本次明确限制条件
2. 快捷指令
3. 用户明确指定的 Workflow
4. 项目级规范
5. 运行环境约束
6. 项目类型
7. 默认推荐 Workflow

## TODO

- Future: workflow scoring
- Future: confidence thresholds
- Future: multi-workflow chaining
