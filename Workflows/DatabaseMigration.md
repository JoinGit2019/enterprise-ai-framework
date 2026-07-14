# DatabaseMigration

## 说明

用于数据库变更、迁移和回滚设计的标准工作流。

## Inputs

- 需求
- 表结构
- 数据规模
- 运行环境

## Outputs

- DatabaseDesign.md
- Migration notes
- Rollback plan
- RiskAnalysis.md
- ChangeSummary.md

## States

- Intake
- SchemaReview
- MigrationPlan
- RiskReview
- Implementation
- Validation
- RollbackPrepared
- Done

## Failure Recovery

- If schema impact is unclear, return to `SchemaReview`
- If migration risk is too high, stop at `MigrationPlan`
- If validation fails, return to `Implementation`
- If rollback is not ready, do not proceed to `Done`

## Deliverables

- Database design document
- Migration notes
- Rollback plan
- Risk analysis document
- Change summary

## Definition of Done

- 迁移方案可执行
- 回滚方案明确
- 索引与性能影响已评估
- 数据安全和一致性已考虑
- 验证已通过
- 回滚路径已可执行

## TODO

- Future: online migration and zero-downtime patterns
- Future: online schema change playbook
