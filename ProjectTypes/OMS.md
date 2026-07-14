# OMS

## 说明

订单管理类项目的默认业务上下文，重点关注订单状态机、事件流转和跨系统一致性。

## 核心关注

- 订单状态机
- 幂等处理
- 状态流转
- 仓配协同
- 异步事件一致性

## 默认约束

- 状态流转必须明确
- 回调与补单必须考虑幂等
- 关键状态变化必须有日志和审计

## TODO

- Future: order lifecycle patterns
- Future: event-driven workflows
