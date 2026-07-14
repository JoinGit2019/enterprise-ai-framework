# Workflows

## 说明

Workflows 用于把多个原子能力串成完整交付路径。

## 当前工作流

- `FeatureDevelopment`
- `BugFix`
- `ExistingLogicConfirmation`
- `CodeReview`
- `ApiDevelopment`
- `FrontendImplementation`
- `DatabaseMigration`

## 设计原则

- 一个工作流只解决一类交付问题
- 工作流必须定义输入、输出、状态和完成标准
- 工作流必须说明失败回退路径
- 工作流必须能映射到文档产物

## 使用建议

- 先选 Profile
- 再选 Workflow
- 再由 Orchestrator 按需加载 Skills 和 Templates

## 示例包

- `Workflows/Examples/README.md`

## 入口文档

- `Orchestrator/WorkflowTemplateMatrix.md`

## TODO

- Future: workflow chaining
- Future: approval and checkpoint model
- Future: release workflow
