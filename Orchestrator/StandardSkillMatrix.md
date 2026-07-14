# StandardSkillMatrix

## 说明

这里记录 Standard 与 Skill 的常见映射关系，帮助 Orchestrator 在执行某个 Skill 时加载对应的质量规则。

## 读法

- Standard 定义“质量约束”
- Skill 定义“执行能力”
- 一个 Skill 通常需要多个 Standard
- 一个 Standard 也会被多个 Skill 复用

## 映射关系

| Skill | 重点标准 | 说明 |
|---|---|---|
| `RequirementAnalysis` | `Documentation`, `NamingConvention` | 需求分析需要稳定术语和清晰文档结构 |
| `TechnicalDesign` | `Coding`, `Documentation`, `Performance`, `Security` | 技术设计需要同时考虑实现、性能和安全 |
| `RiskAnalysis` | `Security`, `Performance`, `ExceptionHandling`, `Documentation` | 风险分析需要覆盖异常、安全、性能和回滚 |
| `ExistingLogicAnalysis` | `Documentation`, `Logging`, `ExceptionHandling`, `NamingConvention` | 现有逻辑确认需要清晰记录入口、调用链、事实和疑点 |
| `DatabaseDesign` | `Performance`, `Security`, `Documentation` | 数据库设计重点关注索引、注入风险和迁移说明 |
| `ApiDesign` | `Security`, `ExceptionHandling`, `Documentation`, `NamingConvention` | 接口设计重点关注鉴权、错误码和命名稳定性 |
| `TaskBreakdown` | `Documentation`, `Testing` | 任务拆分需要明确验收和测试边界 |
| `CodeGeneration` | `Coding`, `CodeStyle`, `Commenting`, `Logging`, `ExceptionHandling`, `Security` | 代码生成必须遵守编码、注释、日志、异常和安全规则 |
| `FrontendImplementation` | `Frontend`, `CodeStyle`, `Commenting`, `Security`, `Testing` | 前端实现需要关注现有实现复用、兼容性、样式作用域、交互逻辑和接口安全 |
| `Debugging` | `Logging`, `ExceptionHandling`, `Testing`, `Documentation` | 排障需要日志、异常链路和验证步骤 |
| `UnitTesting` | `Testing`, `NamingConvention`, `Documentation` | 测试需要命名清晰、覆盖关键路径 |
| `CodeReview` | `Coding`, `CodeStyle`, `Security`, `Performance`, `Testing` | 代码评审需要检查兼容、质量、安全、性能和测试 |
| `ApiDocumentation` | `Documentation`, `NamingConvention`, `ExceptionHandling` | 接口文档需要稳定字段、错误码和示例 |
| `ChangeSummary` | `Documentation`, `Testing`, `ExceptionHandling` | 变更总结需要说明影响、验证和回滚 |

## 使用原则

- 执行 Skill 前先加载相关 Standard
- 用户或项目规范明确指定时，以项目规范优先
- 标准只约束质量，不替代业务判断
- 对旧项目必须同时考虑兼容性和现有风格

## TODO

- Future: standard priority by Profile
- Future: mandatory standards per Workflow
- Future: project-level standards override
