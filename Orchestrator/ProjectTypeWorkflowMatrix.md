# ProjectTypeWorkflowMatrix

## 说明

这里记录 ProjectType 与 Workflow 的常见映射关系，帮助 Orchestrator 在识别业务域后快速选择默认工作流。

## 读法

- ProjectType 定义“是什么业务”
- Workflow 定义“怎么交付”
- 一个 ProjectType 可以对应多个 Workflow
- 同一个 Workflow 也可以服务多个 ProjectType

## 映射关系

| ProjectType | 默认 Workflow | 常见补充 Workflow | 说明 |
|---|---|---|---|
| `ERP` | `FeatureDevelopment` | `DatabaseMigration`, `CodeReview`, `BugFix` | 流程型系统，重视审批、库存、财务和数据一致性 |
| `E-Commerce` | `FeatureDevelopment` | `ApiDevelopment`, `BugFix`, `CodeReview` | 订单、优惠券、支付、售后等需求较多 |
| `OMS` | `FeatureDevelopment` | `BugFix`, `DatabaseMigration`, `CodeReview` | 订单状态流转和幂等问题较突出 |
| `WMS` | `FeatureDevelopment` | `DatabaseMigration`, `BugFix`, `CodeReview` | 库存、批次、库位和并发控制优先级高 |
| `CRM` | `FeatureDevelopment` | `ApiDevelopment`, `CodeReview`, `BugFix` | 客户数据、线索流转和权限隔离较重要 |
| `Finance` | `FeatureDevelopment` | `DatabaseMigration`, `CodeReview`, `BugFix` | 金额准确性、审计和对账是核心关注点 |
| `Payment` | `ApiDevelopment` | `BugFix`, `CodeReview`, `FeatureDevelopment` | 支付、回调、退款和对账常以接口交付为主 |

## 选择原则

- 业务优先于技术标签
- 默认工作流只代表起点，不代表唯一流程
- 如果需求同时涉及多个业务域，优先选最主要的业务域
- 风险较高的项目应优先触发 `RiskAnalysis` 和 `CodeReview`

## 常见组合说明

### ERP

- 适合功能新增与数据迁移并存的场景
- 容易出现流程变更和历史兼容问题

### E-Commerce

- 常见需求集中在接口开发和业务功能新增
- 需关注高并发、营销规则和支付链路

### OMS

- 常见需求集中在订单状态修复和流程新增
- 需要优先关注幂等和状态一致性

### WMS

- 常见需求集中在库存、批次和出入库变更
- 需要优先关注锁、并发和数据准确性

### CRM

- 常见需求集中在客户信息、权限和线索流转
- 需要关注隐私和数据一致性

### Finance

- 常见需求集中在金额、对账和审计
- 需要关注回滚、审批和准确性

### Payment

- 常见需求集中在接口、回调、退款和对账
- 需要关注幂等、风控和状态一致性

## TODO

- Future: domain-specific workflow examples
- Future: domain-specific risk checklists
- Future: domain-specific review checklists

