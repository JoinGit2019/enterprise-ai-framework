# ProjectTypes

## 说明

ProjectTypes 用于描述业务域上下文，帮助 Orchestrator 在不猜测业务的情况下选择合适的工作流和关注点。

## 当前类型

- `ERP`
- `E-Commerce`
- `OMS`
- `WMS`
- `CRM`
- `Finance`
- `Payment`

## 使用原则

- 业务域优先于抽象标签
- 不同类型的项目默认关注点不同
- ProjectType 只描述业务上下文，不替代运行环境

## 入口文档

- `Orchestrator/ProjectTypeWorkflowMatrix.md`

## TODO

- Future: logistics domain
- Future: supply chain domain
- Future: manufacturing domain
- Future: education domain
- Future: healthcare domain
