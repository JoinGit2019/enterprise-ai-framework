# CodeReview

## 说明

用于审查代码变更并形成可执行反馈的标准工作流。

## Inputs

- Diff
- 需求背景
- 运行环境
- 相关文档

## Outputs

- Review findings
- Risk notes
- Suggested fixes
- Approve or revise recommendation

## States

- Intake
- ContextReading
- Review
- Findings
- Revision
- Recheck
- Done

## Failure Recovery

- If context is missing, return to `ContextReading`
- If findings are too uncertain, collect more evidence before `Review`
- If fixes are incomplete, stay in `Revision`
- If new issues appear in recheck, return to `Review`

## Deliverables

- Review report
- Risk notes
- Suggested fixes
- Merge recommendation
- Follow-up items

## Definition of Done

- 已检查兼容性、可维护性、安全性和性能
- 已输出明确建议
- 关键问题已标记
- 建议可以直接执行
- Review 结论清晰明确

## TODO

- Future: severity ranking and merge gating
- Future: automated review checklist
