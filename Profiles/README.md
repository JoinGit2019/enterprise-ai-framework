# Profiles

## 说明

Profiles 是实际使用入口，用于把标准、运行环境、框架约束和默认工作流组合成一个可直接选择的配置。

## 当前可用 Profile

- `PHP5.4-ThinkPHP3`
- `PHP7.2-ThinkPHP5.1`
- `PHP7.4-ThinkPHP5.1`
- `HTML-CSS-JavaScript`

## 选择原则

- 优先按项目实际运行环境选择
- 环境不确定时先确认，不要猜
- 老项目优先保守匹配
- 新项目优先匹配真实版本，不要默认升级

## 组合内容

每个 Profile 都应明确包含：

- 标准
- 运行环境
- 框架约束
- 默认工作流偏好

## 入口文档

- `Orchestrator/ProfileSkillPriorityMatrix.md`

## TODO

- Future: profile selection examples
- Future: auto-detection guidance
- Future: project-specific profile overlays
