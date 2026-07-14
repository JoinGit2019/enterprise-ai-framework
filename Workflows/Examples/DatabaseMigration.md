# DatabaseMigration Example

## 场景

为库存表新增字段并调整索引。

## 前置条件

- 项目类型：`WMS`
- 运行环境：`PHP7.4-ThinkPHP5.1`
- 工作流：`DatabaseMigration`

## 输入

- 需求：库存表增加冻结数量字段
- 数据规模：中等偏大
- 运行要求：必须可回滚

## 标准输出顺序

1. `DatabaseDesign`
2. `RiskAnalysis`
3. 迁移规划
4. 实施
5. 验证
6. `ChangeSummary`

## 预期产物

- 数据库设计说明
- [RiskAnalysis Template](../../Templates/RiskAnalysis.md)
- 迁移脚本或迁移说明
- 回滚方案
- [ChangeSummary Template](../../Templates/ChangeSummary.md)

## 回退点

- 字段影响不明确时回到数据库设计
- 风险太高时暂停迁移
- 验证不通过时回到实施

## Definition of Done

- 迁移可执行
- 回滚可执行
- 索引影响已评估
- 验证已通过
