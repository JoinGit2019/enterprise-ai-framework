# RoleSelectionPolicy

## 说明

这里定义 Orchestrator 如何为任务选择角色。

角色用于提供专业视角，但不替代 Profile、Skill、Workflow 和 Standards。

## 选择顺序

1. 如果用户明确指定角色，优先使用用户指定角色
2. 如果任务是代码实现或排障，默认主角色为 `PHPDeveloper`
3. 如果任务是需求分析，默认主角色为 `ProductManager`
4. 如果任务是技术方案或架构评估，默认主角色为 `Architect`
5. 如果任务是测试或验收，默认主角色为 `Tester`
6. 如果任务是代码评审，默认主角色为 `CodeReviewer`
7. 如果任务涉及 HTML、CSS、JavaScript 或模板页面，默认主角色为 `FrontendDeveloper`

## 常见映射

| 任务类型 | 主角色 | 辅助角色 |
|---|---|---|
| 需求分析 | `ProductManager` | `Architect` |
| 现有逻辑确认 | `PHPDeveloper` | `ProductManager` |
| 问题排查 | `PHPDeveloper` | `Tester` |
| 技术设计 | `Architect` | `PHPDeveloper` |
| 接口开发 | `PHPDeveloper` | `ProductManager`, `Tester` |
| 前端页面修改 | `FrontendDeveloper` | `PHPDeveloper`, `Tester` |
| 数据库迁移 | `Architect` | `PHPDeveloper`, `CodeReviewer` |
| 代码评审 | `CodeReviewer` | `PHPDeveloper`, `Tester` |

## 使用规则

- 每次任务必须有一个主角色
- 辅助角色最多两个
- 角色只影响关注点，不允许覆盖项目事实
- 如果角色之间存在冲突，以 Profile、Standards 和项目现有规范优先

## TODO

- Future: role-to-skill priority matrix
- Future: role combination examples
- Future: team-specific role customization
