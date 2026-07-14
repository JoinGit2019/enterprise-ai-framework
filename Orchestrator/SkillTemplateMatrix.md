# SkillTemplateMatrix

## 说明

这里记录 Skill 与 Template 的常见映射关系，帮助编排器在执行时快速选择合适的文档输出。

## 读法

- Skill 定义“做什么”
- Template 定义“怎么写成文档”
- 一个 Skill 可以对应多个 Template
- 一个 Template 也可能被多个 Skill 复用

## 映射关系

| Skill | 常用模板 | 说明 |
|---|---|---|
| `RequirementAnalysis` | `RequirementAnalysis` | 需求分析直接输出需求文档 |
| `TechnicalDesign` | `TechnicalDesign` | 技术方案直接输出设计文档 |
| `RiskAnalysis` | `RiskAnalysis` | 风险分析直接输出风险文档 |
| `ExistingLogicAnalysis` | `ExistingLogicAnalysis`, `RiskAnalysis`, `ChangeSummary` | 现有逻辑确认或问题梳理后输出功能/问题说明 |
| `DatabaseDesign` | `TechnicalDesign`, `ChangeSummary` | 数据库设计常并入技术设计和变更总结 |
| `ApiDesign` | `ApiDocumentation`, `TechnicalDesign` | 接口设计通常同时影响设计文档和接口文档 |
| `TaskBreakdown` | `ChangeSummary` | 任务拆分常作为交付过程中的内部产物 |
| `CodeGeneration` | `ChangeSummary` | 代码实现通常需要改动摘要 |
| `FrontendImplementation` | `ChangeSummary`, `ExistingLogicAnalysis` | 前端改动需要说明页面或组件、复用情况、样式、交互和验证方式 |
| `Debugging` | `RiskAnalysis`, `ChangeSummary` | 排障结果常要形成风险与变更总结 |
| `UnitTesting` | `ChangeSummary` | 测试结果常纳入变更总结 |
| `CodeReview` | `ChangeSummary` | Review 结果通常进入变更总结或评审报告 |
| `ApiDocumentation` | `ApiDocumentation` | 接口文档技能直接输出接口文档 |
| `ChangeSummary` | `ChangeSummary`, `ReleaseNote` | 变更总结也可作为发布说明基础 |

## 工作流常见组合

### FeatureDevelopment

- `RequirementAnalysis`
- `TechnicalDesign`
- `RiskAnalysis`
- `TaskBreakdown`
- `CodeGeneration`
- `UnitTesting`
- `CodeReview`
- `ApiDocumentation`
- `ChangeSummary`

### BugFix

- `ExistingLogicAnalysis`
- `Debugging`
- `RiskAnalysis`
- `CodeGeneration`
- `UnitTesting`
- `CodeReview`
- `ChangeSummary`

### ExistingLogicConfirmation

- `ExistingLogicAnalysis`
- `RiskAnalysis`
- `ChangeSummary`

### CodeReview

- `CodeReview`
- `ChangeSummary`

### ApiDevelopment

- `RequirementAnalysis`
- `ApiDesign`
- `CodeGeneration`
- `UnitTesting`
- `ApiDocumentation`
- `ChangeSummary`

### FrontendImplementation

- `ExistingLogicAnalysis`
- `FrontendImplementation`
- `UnitTesting`
- `CodeReview`
- `ChangeSummary`

### DatabaseMigration

- `DatabaseDesign`
- `RiskAnalysis`
- `ChangeSummary`

## 使用原则

- 先选 Skill，再选 Template
- 文档产物必须和技能职责一致
- 不要为了凑文档而生成无关内容
- 一个工作流尽量复用同一组模板风格

## TODO

- Future: matrix for ProjectType to Workflow
- Future: matrix for Profile to Skill priority
- Future: matrix for template completeness checks
