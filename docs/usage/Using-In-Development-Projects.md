# Using In Development Projects

## 说明

这份文档说明如何在实际业务项目中使用本框架，适用于 PhpStorm、Qoder、Codex、Claude Code、Cursor 等开发工具。

本框架既可以作为文档规则目录使用，也可以作为 Codex / Qoder 插件使用。

项目内规则模式的核心使用方式是：把框架放进业务项目，然后在项目根目录用规则文件告诉 AI 工具如何读取和使用它。

默认推荐目录名是 `ai-framework/`，但这不是强制名称。如果你使用其他目录名，例如 `enterprise-ai-framework/`，需要同步修改业务项目 `AGENTS.md` 里的框架路径和扫描命令。

## 推荐接入方式

### 方式一：作为项目内目录

适合团队暂时不想引入 Git submodule 的情况。

推荐目录：

```text
your-business-project/
├── app/
├── application/
├── composer.json
├── AGENTS.md
├── .agent/
└── ai-framework/
```

其中 `ai-framework/` 放本项目完整内容。

`ai-framework/` 是推荐默认名称，便于直接复用文档示例和命令。

### 方式二：作为 Git Submodule

适合多个业务项目共享同一套规则。

推荐目录：

```text
your-business-project/
├── AGENTS.md
├── .agent/
└── ai-framework/
```

优点：

- 多项目共用同一套版本
- 可以通过 `VERSION` 控制是否重新加载
- 框架升级和业务代码变更可以分开管理

### 方式三：只复制必要规则

适合非常老的项目或不方便放完整框架的项目。

建议至少复制：

- `VERSION`
- `Standards/`
- `Profiles/`
- `skills/`
- `Workflows/`
- `Templates/`
- `Orchestrator/`

## 项目根目录必须增加 AGENTS.md

业务项目根目录建议放一份 `AGENTS.md`，用于告诉各种 AI 工具如何使用本框架。

示例见：

- `docs/usage/examples/AGENTS.example.md`
- `docs/usage/examples/PHP7.2-ThinkPHP5.1-Project.md`

如果业务项目中的框架目录名为 `ai-framework/`，可以直接将 `AGENTS.example.md` 复制到业务项目根目录并改名为 `AGENTS.md`。

如果目录名不同，需要先替换示例中的框架路径。

## 业务项目 .gitignore

实际业务项目中，`.agent/` 是本地项目上下文缓存，不应该提交到 Git。

业务项目 `.gitignore` 建议增加：

```gitignore
.agent/
```

如果你把框架作为 Git Submodule 使用，`ai-framework/` 应提交为 submodule 引用。

如果你只是临时复制框架到某个业务项目，不希望它进入业务仓库，也可以在业务项目 `.gitignore` 中增加：

```gitignore
ai-framework/
```

但团队长期使用时，更推荐 Git Submodule 或单独仓库版本管理，不建议每个业务项目都复制一份不可追踪的框架目录。

## PhpStorm 中如何使用

PhpStorm 本身不会自动理解本框架，通常要配合 AI 插件、Qoder、Codex 或其他 Agent 使用。

推荐做法：

- 将本框架放入业务项目的 `ai-framework/`
- 在项目根目录创建 `AGENTS.md`
- 在 AI 对话开始时要求工具先读取 `AGENTS.md`
- 第一次任务先执行项目结构扫描
- 后续任务默认复用 `.agent/` 下的项目上下文缓存

## Qoder 中如何使用

Qoder 作为开发 Agent 使用时，推荐读取项目根目录的 `AGENTS.md`。

推荐流程：

1. 打开业务项目
2. 确认项目中存在 `ai-framework/`
3. 确认项目根目录存在 `AGENTS.md`
4. 第一次让 Agent 执行项目结构扫描
5. 后续需求按 Workflow 执行

## 第一次进入项目的流程

第一次进入实际项目时，Agent 必须先做项目结构扫描。

参考：

- `ai-framework/Orchestrator/ProjectScanPolicy.md`

推荐输出：

```text
.agent/context.md
.agent/runtime.md
.agent/structure.md
.agent/context.json
```

推荐命令：

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

如果框架目录不是 `ai-framework/`，请替换命令中的目录名。

如果希望先预览，不写入业务项目：

```bash
bash ai-framework/scripts/scan_project.sh .
```

这些文件用于缓存项目结构、运行环境和业务模块。

扫描时默认排除 `.git/`、`.agent/`、`.idea/`、`vendor/`、`node_modules/` 和 `ai-framework/`，避免把依赖、缓存或框架自身误认为业务代码。

## 后续任务的默认流程

后续任务默认不再全量扫描项目。

默认流程：

1. 读取 `AGENTS.md`
2. 读取 `ai-framework/VERSION`
3. 读取 `ai-framework/config/framework.json`
4. 判断框架版本是否变化
5. 读取 `.agent/` 项目上下文缓存
6. 根据任务选择 ProjectType、Profile、Workflow
7. 按矩阵加载必要 Skill、Template、Standard
8. 输出文档或执行代码修改

## 快捷指令用法

业务项目接入 `AGENTS.md` 后，可以使用短命令减少重复提示词。

示例：

```text
API_DOC DiyController.php
LOGIC 会员自动同步逻辑
BUG 订单退款状态异常
FEATURE 新增优惠券领取接口
REVIEW SaleOrderReturn.php
FRONTEND 修改自定义首页样式
SQL_REVIEW 订单列表查询
PROJECT_SCAN
```

这些快捷指令不是 Codex Plugin 的 `/command`，而是通过 `AGENTS.md` 和 `Orchestrator/ShortcutCommands.md` 约定的自然语言路由规则。

如果需要真正的 `/api-doc`、`/logic`、`/bug` 命令，需要后续封装 Codex Plugin。

## 什么时候重新扫描项目

需要重新扫描的情况：

- 用户主动要求重新扫描
- 切换项目或分支
- `composer.json` 变化
- ThinkPHP 或 PHP 版本变化
- 核心目录结构变化
- 新任务涉及未扫描过的模块

## 什么时候重新加载框架

需要重新加载框架的情况：

- `ai-framework/VERSION` 变化
- `ai-framework/config/framework.json` 变化
- Orchestrator 矩阵变化
- Standards / Profiles / Skills / Workflows / Templates 变化

如果 `VERSION` 没变，默认不需要重新完整加载框架。

## 推荐项目结构

```text
your-business-project/
├── AGENTS.md
├── .agent/
│   ├── context.md
│   ├── runtime.md
│   ├── structure.md
│   └── context.json
├── ai-framework/
│   ├── VERSION
│   ├── Standards/
│   ├── Profiles/
│   ├── skills/
│   ├── Workflows/
│   ├── Templates/
│   └── Orchestrator/
└── application/
```

## 推荐使用原则

- 先读取项目结构，再执行需求
- 先确认 Profile，再生成代码
- 先输出分析和设计，再进入实现
- 先确认现有逻辑，再判断是否需要修改
- 框架内容按版本缓存，不每次全量加载
- 项目结构按 `.agent/` 缓存，不每次全量扫描

## TODO

- Future: Qoder-specific rule file examples
- Future: PhpStorm AI plugin examples
- Future: Codex plugin packaging
- Future: 多项目 Monorepo 接入示例
