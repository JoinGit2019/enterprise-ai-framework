# Roles

## 说明

Roles 用于定义 Agent 在执行任务时采用的专业视角。

角色不替代 Standards、Profiles、Skills 或 Workflows。角色只决定默认关注点、表达方式和判断习惯。

## 当前角色

- `PHPDeveloper`
- `ProductManager`
- `Architect`
- `Tester`
- `CodeReviewer`
- `FrontendDeveloper`

## 使用原则

- 角色用于设定“从什么专业视角看问题”
- Profile 用于设定“当前项目运行环境是什么”
- Skill 用于设定“当前要执行什么能力”
- Workflow 用于设定“当前交付路径是什么”
- 同一个任务可以组合多个角色，但必须有主角色

## 推荐选择

- 写代码或排查后端问题：`PHPDeveloper`
- 分析需求和业务规则：`ProductManager`
- 设计方案和评估架构影响：`Architect`
- 验证功能和设计测试用例：`Tester`
- 审查变更和风险：`CodeReviewer`
- 修改 HTML、CSS、JavaScript 或模板页面：`FrontendDeveloper`

## 禁止事项

- 不要只定义角色而不加载 Profile
- 不要让角色覆盖项目已有规范
- 不要用角色替代版本约束
- 不要为一个简单任务同时加载过多角色

## TODO

- Future: DBA
- Future: DevOpsEngineer
- Future: SecurityEngineer
