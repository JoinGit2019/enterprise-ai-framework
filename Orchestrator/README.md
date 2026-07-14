# Orchestrator

## 说明

编排层负责根据用户输入、项目上下文和运行环境，选择合适的角色、标准、Profile、Skill、Workflow 和模板。

## 目标

- 自动识别当前场景
- 避免直接跳到代码生成
- 优先输出分析、设计和风险内容
- 保持交付过程可追溯

## 组成

- `ContextDetection.md` - 上下文识别规则
- `RoutingPolicy.md` - 工作流路由规则
- `ShortcutCommands.md` - 快捷指令路由规则
- `FallbackPolicy.md` - 无法确认时的兜底策略
- `CachePolicy.md` - 框架与项目上下文缓存规则
- `ProjectScanPolicy.md` - 实际项目第一次扫描规则

## 工作方式

1. 读取 `VERSION` 与 `config/framework.json`
2. 读取或生成 `.agent/` 项目上下文
3. 识别上下文和任务类型
4. 选择 Role
5. 选择 Profile
6. 选择 Workflow
7. 按需加载 Skills
8. 按模板输出文档

## 常见场景

### 新增功能

- 先输出需求分析
- 再输出技术设计
- 再输出风险分析
- 再拆分任务
- 再开发、测试、评审和补文档

### 缺陷修复

- 先定位根因
- 再给出修复方案
- 再修改代码
- 再补回归测试
- 再输出变更总结

### 接口开发

- 先明确接口需求
- 再输出接口设计
- 再开发实现
- 再补测试
- 再生成接口文档

## 输出要求

- 路由结果必须明确
- 不能只给出一个模糊建议
- 不能绕过版本识别直接落代码
- 不能省略用户确认点

## 入口文档

- `ContextDetection.md`
- `RoutingPolicy.md`
- `ShortcutCommands.md`
- `FallbackPolicy.md`
- `SkillTemplateMatrix.md`
- `ProjectTypeWorkflowMatrix.md`
- `ProfileSkillPriorityMatrix.md`
- `WorkflowTemplateMatrix.md`
- `StandardSkillMatrix.md`
- `CachePolicy.md`
- `ProjectScanPolicy.md`
- `RoleSelectionPolicy.md`
- `../config/framework.json`
- `../schemas/project-context.schema.json`

## TODO

- Future: Java workflow routing
- Future: Go workflow routing
- Future: Python workflow routing
- Future: MCP-aware orchestration
- Future: routing examples for each project type
- Future: full workflow-to-template matrix
- Future: profile-to-skill priority matrix examples
- Future: workflow-to-template examples
- Future: standard-to-skill examples
- Future: role-to-workflow examples
