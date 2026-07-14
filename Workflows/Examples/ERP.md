# ERP Example

## 场景

为 ERP 系统新增“审批流配置”功能。

## 前置条件

- 项目类型：`ERP`
- 运行环境：`PHP7.2-ThinkPHP5.1`
- 工作流：`FeatureDevelopment`

## 输入

- 需求：支持按单据类型配置审批流
- 业务约束：历史流程不能中断
- 运行要求：保持现有审批记录兼容

## 标准输出顺序

1. `RequirementAnalysis`
2. `TechnicalDesign`
3. `RiskAnalysis`
4. `TaskBreakdown`
5. `CodeGeneration`
6. `UnitTesting`
7. `CodeReview`
8. `ChangeSummary`

## 预期产物

- 需求分析
- 技术设计
- 风险分析
- 任务拆分
- 代码变更
- 测试用例
- 评审结论
- 变更总结

## 回退点

- 流程边界不明确时回到需求分析
- 审批兼容风险过高时回到设计
- 测试失败时回到实现

## Definition of Done

- 审批流可配置
- 历史流程不受影响
- 风险和回滚建议已说明

