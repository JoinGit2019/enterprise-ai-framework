# ProfileSkillPriorityMatrix

## 说明

这里记录 Profile 与 Skill 的优先级关系，帮助 Orchestrator 在选定运行环境后决定先加载哪些能力。

## 读法

- Profile 定义“在哪个环境里做事”
- Skill Priority 定义“先用哪些能力”
- 优先级不是排斥关系，而是默认加载顺序

## 映射关系

### PHP5.4-ThinkPHP3

1. `RequirementAnalysis`
2. `ExistingLogicAnalysis`
3. `Debugging`
4. `TechnicalDesign`
5. `RiskAnalysis`
6. `DatabaseDesign`
7. `TaskBreakdown`
8. `CodeGeneration`
9. `FrontendImplementation`
10. `UnitTesting`
11. `CodeReview`
12. `ApiDocumentation`
13. `ChangeSummary`

### PHP7.2-ThinkPHP5.1

1. `RequirementAnalysis`
2. `ExistingLogicAnalysis`
3. `TechnicalDesign`
4. `ApiDesign`
5. `RiskAnalysis`
6. `TaskBreakdown`
7. `CodeGeneration`
8. `FrontendImplementation`
9. `UnitTesting`
10. `CodeReview`
11. `ApiDocumentation`
12. `ChangeSummary`

### PHP7.4-ThinkPHP5.1

1. `RequirementAnalysis`
2. `ExistingLogicAnalysis`
3. `TechnicalDesign`
4. `ApiDesign`
5. `RiskAnalysis`
6. `TaskBreakdown`
7. `CodeGeneration`
8. `FrontendImplementation`
9. `UnitTesting`
10. `CodeReview`
11. `ApiDocumentation`
12. `ChangeSummary`

### HTML-CSS-JavaScript

1. `ExistingLogicAnalysis`
2. `FrontendImplementation`
3. `RequirementAnalysis`
4. `TaskBreakdown`
5. `UnitTesting`
6. `CodeReview`
7. `ChangeSummary`

## 说明

### PHP5.4-ThinkPHP3

- 优先兼容旧语法和旧架构
- 优先排障和风险识别
- 优先复用现有代码，不做大规模重构

### PHP7.2-ThinkPHP5.1

- 优先需求分析和设计落地
- 在兼容前提下使用较新的 PHP 语法
- 优先接口设计和常规企业开发能力

### PHP7.4-ThinkPHP5.1

- 优先利用较新的语言能力
- 仍然遵守历史项目兼容性
- 优先保持现有代码风格和结构

### HTML-CSS-JavaScript

- 优先复用现有页面、组件、样式和工具函数
- 优先确认浏览器目标和构建环境
- 优先控制 CSS 作用域和 JS 影响范围
- 不默认引入新依赖或新构建工具

## 使用原则

- 不同 Profile 的优先级顺序可以不同
- 如果项目已有强约束，应以项目约束优先
- 如果用户指定只做某个技能，可跳过其他默认优先级
- 默认优先级只用于 Orchestrator 首次加载

## TODO

- Future: profile-to-template priority matrix
- Future: profile-to-workflow routing examples
- Future: profile override rules
