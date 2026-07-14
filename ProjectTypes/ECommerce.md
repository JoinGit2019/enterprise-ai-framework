# E-Commerce

## 说明

电商类项目的默认业务上下文，适用于商品、订单、营销、支付、发货、售后等场景。

## 核心关注

- 商品与类目
- 订单生命周期
- 优惠券与促销活动
- 支付与对账
- 发货与物流
- 售后与退款

## 默认约束

- 订单状态变更必须可追溯
- 促销逻辑必须考虑幂等和并发
- 支付与退款必须考虑回调与对账
- 不得随意修改历史接口返回结构

## TODO

- Future: promotion workflows
- Future: risk control workflows
- Future: reconciliation workflows
