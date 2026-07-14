# RFC-0001: Project Architecture

## 状态

Draft

## 背景

本项目的目标不是单纯做一组提示词，也不是只做代码生成技能，而是构建一套面向企业软件研发全生命周期的 AI 软件工程框架。

企业真实场景中，需求的交付通常需要经过需求分析、方案设计、风险评估、开发、测试、评审、文档落地和上线总结等多个阶段。单一的 Skill 很难覆盖完整流程，因此需要分层设计。

## 目标

- 支持企业级软件研发闭环
- 支持多个工作流，而不是单一流程
- 支持多个 PHP 与 ThinkPHP 版本组合
- 支持统一标准和可组合能力
- 支持文档先行和可追溯输出

## 八层架构

### 1. Standards

企业研发标准层，定义全局约束。

包括但不限于：

- Coding
- Commenting
- CodeStyle
- NamingConvention
- Logging
- ExceptionHandling
- Security
- Performance
- Testing
- Documentation

这一层优先级最高，用于约束所有后续层的行为。

### 2. Roles

角色层，定义 Agent 在不同任务中采用的专业视角。

例如：

- PHPDeveloper
- ProductManager
- Architect
- Tester
- CodeReviewer

角色不替代 Standards、Profiles、Skills 或 Workflows。角色只决定默认关注点、表达方式和判断习惯。

### 3. Runtimes

运行环境层，定义语言、框架、版本和兼容范围。

当前重点支持：

- PHP 5.4 + ThinkPHP 3
- PHP 7.2 + ThinkPHP 5.1
- PHP 7.4 + ThinkPHP 5.1
- HTML / CSS / JavaScript

这一层用于避免语法误用、框架 API 误用和版本混淆。

### 4. ProjectTypes

项目类型层，描述业务域与行业上下文。

例如：

- ERP
- E-Commerce
- OMS
- WMS
- CRM
- Finance
- Payment

这一层决定业务约束、设计重点和默认风险关注点。

### 5. Skills

原子能力层，描述最小可复用能力。

例如：

- RequirementAnalysis
- TechnicalDesign
- RiskAnalysis
- DatabaseDesign
- ApiDesign
- TaskBreakdown
- CodeGeneration
- Debugging
- UnitTesting
- CodeReview
- ApiDocumentation
- ChangeSummary

### 6. Workflows

工作流层，用于将多个 Skills 编排成完整交付过程。

例如：

- FeatureDevelopment
- BugFix
- CodeReview
- ApiDevelopment
- FrontendImplementation
- DatabaseMigration

### 7. Templates

模板层，定义标准化文档结构。

例如：

- RequirementAnalysis
- TechnicalDesign
- RiskAnalysis
- ApiDocumentation
- ChangeSummary
- ReleaseNote

### 8. Orchestrator

编排层，负责根据用户输入、项目上下文和运行环境选择合适的 profile、workflow、skills 和 templates。

### Profiles

Profiles 不是独立的核心层级，但它是实际使用时最重要的组合入口。

Profile 的作用是把以下内容打包成一个可直接使用的配置：

- Standards
- Runtimes
- Framework compatibility
- 默认工作流

例如：

- `PHP5.4-ThinkPHP3`
- `PHP7.2-ThinkPHP5.1`
- `PHP7.4-ThinkPHP5.1`

Profiles 让用户不必手工拼装各层规则，减少选择成本和误配风险。

## 设计原则

- 先分析，再实现
- 先文档，再落地
- 先兼容，再优化
- 先复用，再新增
- 先最小变更，再扩展

## 约束

- 不允许在未确认版本时默认使用新语法
- 不允许为统一风格而破坏历史项目兼容性
- 不允许把所有能力塞进一个超大 Skill
- 不允许将工作流固化为唯一流程

## 未来扩展

本架构预留以下扩展方向：

- Java / Spring Boot
- Go
- Python
- Laravel
- AI workflow integration
- MCP tool integration
- RAG and knowledge workflows
