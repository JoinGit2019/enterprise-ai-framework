# FrontendImplementation

## 说明

用于修改 HTML、CSS、JavaScript、模板页面、组件页面和前端交互。

## Inputs

- 页面或模板需求
- 相关模板文件
- 相关组件文件
- 相关 CSS 文件
- 相关 JavaScript 文件
- 接口、状态或模板变量
- 现有页面风格

## Outputs

- HTML / 模板变更
- 组件变更
- CSS 变更
- JavaScript 变更
- 验证说明
- ChangeSummary.md

## States

- Intake
- ContextReading
- PageEntryDiscovery
- InteractionAnalysis
- Implementation
- Validation
- Review
- Documentation
- Done

## Failure Recovery

- If page entry is unclear, return to `ContextReading`
- If selector or event binding is uncertain, return to `InteractionAnalysis`
- If API response is unclear, confirm backend contract before implementation
- If style impact is too broad, narrow CSS scope before continuing
- If validation fails, return to `Implementation`

## Deliverables

- Page change summary
- Frontend resource changes
- Interaction notes
- Validation notes
- Change summary

## Definition of Done

- 页面入口已确认
- HTML / CSS / JavaScript 改动范围明确
- 变量、状态和接口返回兼容
- 页面交互已验证
- 变更说明已输出

## TODO

- Future: browser compatibility checklist
- Future: frontend screenshot validation
- Future: Vue / React workflow variants
