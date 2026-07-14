# ERP

## 说明

企业资源管理类项目的默认业务上下文，适用于采购、库存、订单、审批、财务等强流程型系统。

## 核心关注

- 业务流程完整性
- 数据一致性
- 审批链路可追溯
- 事务与回滚能力
- 权限隔离
- 批量处理与导入导出

## 默认约束

- 不得随意破坏历史流程
- 不得在未评估影响的情况下调整核心数据结构
- 关键操作必须有日志和审计信息

## TODO

- Future: procurement workflows
- Future: finance workflows
- Future: warehouse workflows
