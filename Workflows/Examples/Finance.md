# Finance Example

## 场景

为财务系统新增“对账差异处理”功能。

## 前置条件

- 项目类型：`Finance`
- 运行环境：`PHP7.4-ThinkPHP5.1`
- 工作流：`FeatureDevelopment`

## 输入

- 需求：识别并处理订单与支付流水差异
- 业务约束：金额准确性优先
- 运行要求：必须可审计

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

- 差异规则不明确时回到需求分析
- 审计链路不完整时回到设计
- 金额风险过高时暂停实现

## Definition of Done

- 差异处理逻辑可用
- 审计与日志可追踪
- 回滚建议已记录

