# ApiDevelopment Example

## 场景

为优惠券领取能力新增接口。

## 前置条件

- 项目类型：`E-Commerce`
- 运行环境：`PHP7.4-ThinkPHP5.1`
- 工作流：`ApiDevelopment`

## 输入

- 接口需求：用户领取优惠券
- 鉴权规则：已登录用户
- 返回要求：保持统一响应结构

## 标准输出顺序

1. `RequirementAnalysis`
2. `ApiDesign`
3. `CodeGeneration`
4. `UnitTesting`
5. `ApiDocumentation`
6. `ChangeSummary`

## 预期产物

- [RequirementAnalysis Template](../../Templates/RequirementAnalysis.md)
- 接口设计
- 代码变更
- 测试用例
- [ApiDocumentation Template](../../Templates/ApiDocumentation.md)
- [ChangeSummary Template](../../Templates/ChangeSummary.md)

## 回退点

- 接口语义不清楚时回到需求分析
- 返回结构不稳定时回到接口设计
- 文档和实现不一致时回到文档阶段

## Definition of Done

- 接口可调用
- 参数和返回值已明确
- 测试已覆盖关键路径
- 文档已补齐
