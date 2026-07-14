# Orchestrator Examples

## 说明

这里给出几个最常见的路由示例，帮助快速理解编排器如何选择 Profile、Workflow 和 Skills。

## 示例一：新增优惠券领取接口

### 输入

- 用户描述：新增优惠券领取接口
- 项目类型：E-Commerce
- 运行环境：PHP 7.2 + ThinkPHP 5.1

### 路由结果

- Profile: `PHP7.2-ThinkPHP5.1`
- Workflow: `ApiDevelopment`
- Skills:
  - `RequirementAnalysis`
  - `ApiDesign`
  - `CodeGeneration`
  - `UnitTesting`
  - `ApiDocumentation`
  - `ChangeSummary`
- Templates:
  - `RequirementAnalysis`
  - `ApiDocumentation`
  - `ChangeSummary`

### 输出顺序

1. 需求分析
2. 接口设计
3. 代码实现
4. 单元测试
5. 接口文档
6. 改动总结

## 示例二：修复订单状态不更新的问题

### 输入

- 用户描述：修复订单状态不更新的问题
- 项目类型：OMS
- 运行环境：PHP 5.4 + ThinkPHP 3

### 路由结果

- Profile: `PHP5.4-ThinkPHP3`
- Workflow: `BugFix`
- Skills:
  - `Debugging`
  - `RiskAnalysis`
  - `CodeGeneration`
  - `UnitTesting`
  - `CodeReview`
  - `ChangeSummary`
- Templates:
  - `RiskAnalysis`
  - `ChangeSummary`

### 输出顺序

1. 根因分析
2. 风险分析
3. 修复方案
4. 代码修改
5. 回归测试
6. 代码复核
7. 变更总结

## 示例三：调整库存表字段

### 输入

- 用户描述：调整库存表字段
- 项目类型：WMS
- 运行环境：PHP 7.4 + ThinkPHP 5.1

### 路由结果

- Profile: `PHP7.4-ThinkPHP5.1`
- Workflow: `DatabaseMigration`
- Skills:
  - `DatabaseDesign`
  - `RiskAnalysis`
  - `ChangeSummary`
- Templates:
  - `TechnicalDesign`
  - `RiskAnalysis`
  - `ChangeSummary`

### 输出顺序

1. 数据库设计
2. 风险分析
3. 迁移规划
4. 实施
5. 验证
6. 改动总结

## TODO

- Future: more examples for ERP and Finance
- Future: examples for bugfix under PHP 7.4
- Future: examples for code review workflows

