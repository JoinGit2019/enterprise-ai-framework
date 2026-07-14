# BugFix Example

## 场景

修复订单状态不更新的问题。

## 前置条件

- 项目类型：`OMS`
- 运行环境：`PHP5.4-ThinkPHP3`
- 工作流：`BugFix`

## 输入

- 问题描述：订单支付后状态未更新
- 错误日志：状态流转异常
- 复现步骤：支付成功后刷新订单详情

## 标准输出顺序

1. `Debugging`
2. `RiskAnalysis`
3. `CodeGeneration`
4. `UnitTesting`
5. `CodeReview`
6. `ChangeSummary`

## 预期产物

- 根因分析说明
- [RiskAnalysis Template](../../Templates/RiskAnalysis.md)
- 代码变更
- 回归测试
- 评审意见
- [ChangeSummary Template](../../Templates/ChangeSummary.md)

## 回退点

- 无法复现时回到排障阶段
- 根因不明确时继续补日志和样例
- 回归失败时回到实现

## Definition of Done

- 问题已复现或根因已确认
- 修复已生效
- 回归测试已通过
- 风险和回滚建议已说明
