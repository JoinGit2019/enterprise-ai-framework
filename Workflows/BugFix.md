# BugFix

## 说明

用于定位并修复缺陷的标准工作流。

## Inputs

- 问题描述
- 错误日志
- 复现步骤
- 影响范围

## Outputs

- Root cause analysis
- Fix plan
- Code changes
- Regression tests
- Review notes
- ChangeSummary.md

## States

- Intake
- Reproduction
- RootCauseAnalysis
- FixProposal
- Implementation
- RegressionTesting
- Review
- Done

## Failure Recovery

- If the issue cannot be reproduced, collect more logs and return to `Reproduction`
- If root cause is unclear, stay in `RootCauseAnalysis`
- If the fix introduces new risk, return to `FixProposal`
- If regression fails, return to `Implementation`
- If the problem is environment-specific, record the dependency and wait for confirmation

## Deliverables

- Root cause analysis document
- Fix proposal document
- Code changes
- Regression test artifacts
- Code review notes
- Change summary

## Definition of Done

- 缺陷可复现或已明确根因
- 修复方案已确认
- 代码已修复
- 回归已完成
- 影响面已说明
- 回滚建议已记录
- 线上或本地复现信息已归档

## TODO

- Future: hotfix and emergency rollback path
- Future: incident report template
