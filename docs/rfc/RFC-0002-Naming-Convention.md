# RFC-0002: Naming Convention

## 状态

Draft

## 目标

统一仓库命名方式，降低模型歧义，提升可维护性，并让人和 Agent 都能快速理解目录与能力含义。

## 基本规则

### 1. 使用官方全称

除非属于事实标准，否则不使用缩写命名。

推荐：

- `ThinkPHP`
- `Laravel`
- `Spring Boot`
- `MySQL`
- `Redis`
- `Java`
- `Python`
- `Go`

不推荐：

- `tp`
- `larval`
- 模糊缩写目录名

### 2. 使用 PascalCase

目录名、Skill 名、Workflow 名、Profile 名默认使用 PascalCase。

示例：

- `CodeReview`
- `RequirementAnalysis`
- `PHP7.2-ThinkPHP5.1`
- `ApiDocumentation`

### 3. 版本号必须显式写出

如果一个能力或配置依赖具体版本，版本号必须写在名称中。

示例：

- `PHP5.4`
- `PHP7.2`
- `PHP7.4`
- `ThinkPHP3`
- `ThinkPHP5.1`
- `PHP7.2-ThinkPHP5.1`

### 4. Profile 命名规则

Profile 用于组合语言、框架和运行约束。

推荐格式：

```text
LanguageVersion-FrameworkVersion
```

示例：

- `PHP5.4-ThinkPHP3`
- `PHP7.2-ThinkPHP5.1`
- `PHP7.4-ThinkPHP5.1`

### 5. 模板命名规则

模板文件名应与输出文档的业务目的保持一致。

示例：

- `RequirementAnalysis.md`
- `TechnicalDesign.md`
- `RiskAnalysis.md`
- `ChangeSummary.md`

### 6. 工作流命名规则

工作流名字应表达业务动作，不要用抽象而模糊的名称。

示例：

- `FeatureDevelopment`
- `BugFix`
- `ApiDevelopment`
- `DatabaseMigration`

## 目录命名建议

- 顶层目录使用英文全称
- 子目录保持 PascalCase
- 不使用下划线命名
- 不使用不必要的简写

## 兼容历史项目

如果历史项目本身使用缩写或旧命名方式，新的规范不要求强制重命名历史资产，但新内容必须按照本规范创建。

## 未来扩展

未来新增语言和框架时，应继续使用全称命名：

- `Java`
- `Go`
- `Python`
- `Laravel`
- `SpringBoot`
- `MCP`
- `OpenAPI`

