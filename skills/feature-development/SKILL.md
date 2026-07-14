---
name: feature-development
description: >
  Implement a new feature with the full enterprise SDLC loop. Use when the user
  says FEATURE, asks to add a feature, add an API, implement a new business
  flow, or modify behavior with design and delivery artifacts.
argument-hint: "<requirement description>"
license: MIT
---

# FeatureDevelopment

用于新增功能或较完整的业务变更。

## 默认流程

1. RequirementAnalysis
2. TechnicalDesign
3. RiskAnalysis
4. TaskBreakdown
5. 等待用户确认
6. CodeGeneration
7. UnitTesting
8. CodeReview
9. ApiDocumentation，如涉及接口
10. ChangeSummary

## 规则

- 不要直接写代码
- 不要未经确认修改数据库结构
- 不要破坏历史接口返回结构
- 优先复用现有 Service、Model、工具类和前端组件
- 兼容当前 PHP、ThinkPHP 和前端环境
