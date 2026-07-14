# WMS

## 说明

仓储管理类项目的默认业务上下文，重点关注库存准确性、批次追踪和并发控制。

## 核心关注

- 库存准确性
- 批次与库位管理
- 出入库流程
- 锁与并发
- 盘点与纠错

## 默认约束

- 库存变动必须可审计
- 高并发操作必须考虑锁和幂等
- 批次和库位信息不得随意丢失

## TODO

- Future: barcode workflows
- Future: batch tracing workflows
