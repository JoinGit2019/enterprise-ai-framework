# Payment

## 说明

支付类项目的默认业务上下文，重点关注幂等、回调、对账和状态一致性。

## 核心关注

- 支付幂等
- 异步回调
- 对账流程
- 风险控制
- 状态一致性

## 默认约束

- 支付结果必须可追溯
- 回调必须支持重复通知
- 退款与补单必须谨慎处理

## TODO

- Future: payment channel integration patterns
- Future: anti-fraud workflows
