# WorkflowTemplateMatrix

## 说明

这里记录 Workflow 与 Template 的常见映射关系，帮助编排器在确定工作流后稳定输出对应文档。

## 读法

- Workflow 定义“交付路径”
- Template 定义“文档产物”
- 一个 Workflow 通常对应多个 Template
- 同一个 Template 也可以被多个 Workflow 复用

## 映射关系

| Workflow | 常用模板 | 说明 |
|---|---|---|
| `FeatureDevelopment` | `RequirementAnalysis`, `TechnicalDesign`, `RiskAnalysis`, `ApiDocumentation`, `ChangeSummary`, `ReleaseNote` | 新功能往往需要完整的需求、设计、风险和发布说明 |
| `BugFix` | `RiskAnalysis`, `ChangeSummary`, `ReleaseNote` | 缺陷修复通常需要问题分析、变更总结，必要时补发布说明 |
| `ExistingLogicConfirmation` | `ExistingLogicAnalysis`, `RiskAnalysis`, `ChangeSummary` | 现有逻辑确认或问题梳理需要输出事实说明和后续建议 |
| `CodeReview` | `ChangeSummary` | 评审结果通常沉淀为简明的评审或变更总结 |
| `ApiDevelopment` | `RequirementAnalysis`, `ApiDocumentation`, `ChangeSummary` | 接口开发通常需要需求、接口文档和变更总结 |
| `FrontendImplementation` | `ExistingLogicAnalysis`, `ChangeSummary` | 前端页面修改需要说明页面入口、交互逻辑和验证方式 |
| `DatabaseMigration` | `TechnicalDesign`, `RiskAnalysis`, `ChangeSummary`, `ReleaseNote` | 数据库变更需要技术方案、风险和发布说明 |

## 各工作流文档产物说明

### FeatureDevelopment

- 适合输出最完整的文档链路
- 默认应至少包含需求、设计、风险和变更总结

### BugFix

- 适合输出短链路文档
- 重点是根因、修复方案、回归和变更总结

### ExistingLogicConfirmation

- 适合确认现有功能逻辑或排查问题前先沉淀事实
- 默认不修改代码，重点是入口、调用链、业务规则和证据

### CodeReview

- 适合输出审查结论
- 重点是问题清单、风险点和建议

### ApiDevelopment

- 适合输出接口说明和联调文档
- 重点是请求、响应、错误码和示例

### DatabaseMigration

- 适合输出迁移方案和回滚说明
- 重点是技术设计、风险和发布说明

## 使用原则

- 先确定 Workflow，再补 Template
- 模板必须和工作流产物一致
- 不同工作流可以共享同一模板，但模板内容必须保持稳定
- 文档数量应和任务复杂度匹配，避免无意义膨胀

## TODO

- Future: template completion checklist
- Future: per-workflow document pack examples
- Future: release pipeline documentation
