# FeatureDevelopment Example

## 场景

为电商系统新增“优惠券领取”功能。

## 前置条件

- 项目类型：`E-Commerce`
- 运行环境：`PHP7.2-ThinkPHP5.1`
- 工作流：`FeatureDevelopment`

## 输入

- 产品需求：用户可以领取优惠券
- 业务约束：同一用户同一优惠券只能领取一次
- 运行约束：保持现有接口返回格式

## 标准输出顺序

1. `RequirementAnalysis`
2. `TechnicalDesign`
3. `RiskAnalysis`
4. `TaskBreakdown`
5. `CodeGeneration`
6. `UnitTesting`
7. `CodeReview`
8. `ApiDocumentation`
9. `ChangeSummary`

## 预期产物

- [RequirementAnalysis Template](../../Templates/RequirementAnalysis.md)
- [TechnicalDesign Template](../../Templates/TechnicalDesign.md)
- [RiskAnalysis Template](../../Templates/RiskAnalysis.md)
- [TaskBreakdown](../../skills/TaskBreakdown/README.md)
- 代码变更
- 测试用例
- 评审结论
- [ApiDocumentation Template](../../Templates/ApiDocumentation.md)
- [ChangeSummary Template](../../Templates/ChangeSummary.md)

## 回退点

- 需求不清楚时停在需求分析
- 方案风险过高时停在风险分析
- 测试失败时回到实现
- 文档不一致时回到文档阶段

## Definition of Done

- 功能可用
- 关键边界已确认
- 测试已通过
- 文档已更新
- 变更已可追踪
