# OMS Example

## 场景

修复 OMS 中“订单状态不同步”的问题。

## 前置条件

- 项目类型：`OMS`
- 运行环境：`PHP5.4-ThinkPHP3`
- 工作流：`BugFix`

## 输入

- 问题描述：订单支付成功后未更新状态
- 复现步骤：支付完成后刷新列表仍显示待支付
- 运行要求：不能影响已有补单逻辑

## 标准输出顺序

1. `Debugging`
2. `RiskAnalysis`
3. `CodeGeneration`
4. `UnitTesting`
5. `CodeReview`
6. `ChangeSummary`

## 预期产物

- 根因分析
- 风险分析
- 代码变更
- 回归测试
- 评审结论
- 变更总结

## 回退点

- 无法复现时继续补证据
- 根因不明确时保持在排障阶段
- 回归失败时回到实现

## Definition of Done

- 状态同步问题已修复
- 回归通过
- 不影响现有订单流程

