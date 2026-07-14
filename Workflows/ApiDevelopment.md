# ApiDevelopment

## 说明

用于从需求到接口设计、实现和文档的标准工作流。

## Inputs

- 接口需求
- 业务规则
- 错误码规范
- 运行环境

## Outputs

- ApiDesign.md
- Code changes
- Unit tests
- ApiDocumentation.md
- ChangeSummary.md

## States

- Intake
- ApiDesign
- Implementation
- Testing
- Review
- Documentation
- Done

## Failure Recovery

- If the API definition is unstable, remain in `ApiDesign`
- If implementation diverges from design, return to `Implementation`
- If test coverage is insufficient, return to `Testing`
- If documentation is inconsistent, return to `Documentation`

## Deliverables

- API design document
- Code changes
- Unit tests
- API documentation
- Change summary

## Definition of Done

- 接口定义清晰
- 实现与设计一致
- 测试已覆盖关键路径
- 接口文档已更新
- 返回结构已确认
- 错误码已确认

## TODO

- Future: OpenAPI-first development path
- Future: mock and contract testing
