# E-Commerce Example

## 场景

为电商系统新增“优惠券领取接口”。

## 前置条件

- 项目类型：`E-Commerce`
- 运行环境：`PHP7.2-ThinkPHP5.1`
- 工作流：`ApiDevelopment`

## 输入

- 接口需求：用户领取优惠券
- 鉴权规则：登录用户可领取
- 返回要求：保持统一响应结构

## 标准输出顺序

1. `RequirementAnalysis`
2. `ApiDesign`
3. `CodeGeneration`
4. `UnitTesting`
5. `ApiDocumentation`
6. `ChangeSummary`

## 预期产物

- 需求分析
- 接口设计
- 代码变更
- 测试用例
- 接口文档
- 变更总结

## 回退点

- 接口语义不清时回到需求分析
- 返回结构变动风险过高时回到设计
- 文档和实现不一致时回到文档阶段

## Definition of Done

- 接口可调用
- 参数与返回值明确
- 文档可用于联调

