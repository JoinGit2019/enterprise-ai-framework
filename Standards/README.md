# Standards

## 说明

Standards 是整个框架的最高质量约束，用于定义 Agent 在分析、设计、编码、测试、评审和输出文档时必须遵守的基础规则。

## 当前标准

- `Coding`
- `Commenting`
- `CodeStyle`
- `NamingConvention`
- `Logging`
- `ExceptionHandling`
- `Security`
- `Performance`
- `Testing`
- `Documentation`
- `Frontend`

## 使用原则

- 标准优先于个人偏好
- 项目现有规范优先于通用建议
- 兼容性优先于形式统一
- 质量要求必须能落到代码、测试和文档

## 推荐加载顺序

1. `NamingConvention`
2. `Coding`
3. `CodeStyle`
4. `Commenting`
5. `ExceptionHandling`
6. `Logging`
7. `Security`
8. `Performance`
9. `Testing`
10. `Documentation`
11. `Frontend`

## 与其他层的关系

- Profiles 负责决定当前标准如何适配具体运行环境
- Skills 负责在执行某个能力时引用对应标准
- Workflows 负责把多个 Skill 串成完整交付路径
- Orchestrator 负责按任务类型和上下文选择需要加载的标准

## 入口文档

- `Orchestrator/StandardSkillMatrix.md`

## TODO

- Future: standard-to-skill matrix
- Future: standard completeness checklist
- Future: team-specific standard overlays
