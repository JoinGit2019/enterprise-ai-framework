# ExistingLogicConfirmation

## 说明

用于确认现有功能逻辑、梳理调用链、排查问题前沉淀事实说明的标准工作流。

该工作流默认不修改代码，重点是输出可信的功能说明或问题说明文档。

## Inputs

- 功能名称或问题描述
- 相关接口、页面、任务、模块或日志线索
- 当前项目结构缓存
- 复现步骤或数据样例

## Outputs

- ExistingLogicAnalysis.md
- RiskAnalysis.md
- ChangeSummary.md

## States

- Intake
- ContextReading
- EntryPointDiscovery
- CallChainAnalysis
- RuleConfirmation
- EvidenceSummary
- Documentation
- Done

## Failure Recovery

- If the entry point is unclear, return to `ContextReading`
- If the call chain is incomplete, continue collecting evidence
- If behavior cannot be confirmed from code, mark it as pending confirmation
- If a real defect is confirmed, route to `BugFix`

## Deliverables

- Existing logic analysis document
- Confirmed facts
- Open questions
- Risk notes
- Change or follow-up recommendation

## Definition of Done

- 已确认代码入口
- 已梳理主要调用链
- 已说明关键业务规则
- 已区分事实、推测和待确认事项
- 已输出功能说明或问题说明

## TODO

- Future: source reference convention
- Future: call chain diagram template
- Future: route-to-bugfix handoff format

