# FeatureDevelopment

## 说明

用于新增功能的标准工作流。

## Inputs

- 产品需求
- 现有项目上下文
- 运行环境
- 业务约束

## Outputs

- RequirementAnalysis.md
- TechnicalDesign.md
- RiskAnalysis.md
- TaskBreakdown.md
- Code changes
- Unit tests
- CodeReview report
- ApiDocumentation.md
- ChangeSummary.md

## States

- Intake
- RequirementAnalysis
- TechnicalDesign
- RiskReview
- TaskBreakdown
- Implementation
- Testing
- Review
- Documentation
- Done

## Failure Recovery

- If requirements are unclear, stop at `RequirementAnalysis`
- If runtime or framework version is uncertain, return to `Intake`
- If design risk is too high, add a `RiskReview` checkpoint
- If implementation drifts from design, return to `TechnicalDesign`
- If tests fail, keep the workflow in `Testing` until verified

## Deliverables

- Requirement analysis document
- Technical design document
- Risk analysis document
- Task breakdown document
- Code changes
- Test artifacts
- Code review notes
- API documentation
- Change summary

## Definition of Done

- 需求已分析并形成文档
- 技术方案已确认
- 主要风险已说明
- 代码已落地
- 测试已补充
- 代码已完成自检或评审
- 接口与变更文档已更新
- 所有关键待确认项已关闭
- 交付产物已整理完整

## TODO

- Future: approval gates and rollback checkpoints
- Future: multi-step approval gate
- Future: release note automation
