# Enterprise AI Framework Rules

## 说明

本规则用于 Qoder 中启用 Enterprise AI Software Engineering Framework。

Qoder 在处理项目需求时，应优先读取项目根目录中的：

- `AGENTS.md`
- `.agent/context.md`
- `.agent/runtime.md`
- `.agent/structure.md`
- `.agent/context.json`

如果这些文件不存在，应提示用户先执行：

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

## 工作原则

- 不要每次任务都全量扫描项目
- 不要每次任务都完整加载 `ai-framework/`
- 优先复用现有代码、现有组件、现有样式、现有工具函数
- 先分析，再设计，再实现，再测试，再总结
- 生成代码前必须确认 PHP、ThinkPHP、前端构建链路和项目结构
- 不确定的信息必须标记为“需确认”
- 用户只要求分析、文档或评审时，不得修改代码

## 快捷指令

支持以下短命令：

- `INIT`：读取项目规则和 `.agent/` 上下文
- `API_DOC 文件名`：生成接口文档，不修改代码
- `LOGIC 文件名或功能`：分析现有功能逻辑，不修改代码
- `BUG 问题描述`：排查问题，是否修改取决于用户要求
- `FEATURE 需求描述`：新增功能，先输出分析和方案
- `REVIEW 文件名或变更`：代码评审，不修改代码
- `FRONTEND 页面或需求`：前端修改，遵守前端统一规则
- `SQL_REVIEW 文件名或 SQL`：SQL 风险审查，不修改代码
- `PROJECT_SCAN`：重新扫描项目结构

## 输出要求

- 输出 Markdown
- 说明读取了哪些文件
- 说明选中的 Workflow、Profile、Skill 和 Template
- 涉及接口时输出接口文档
- 涉及变更时输出 ChangeSummary
- 涉及风险时输出 RiskAnalysis
