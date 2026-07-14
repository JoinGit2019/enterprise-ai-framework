# Enterprise AI Software Engineering Framework

Enterprise AI Software Engineering Framework is a Chinese-first operating standard for AI-assisted software delivery.

It is designed to help an agent move through the full SDLC loop instead of jumping directly to code generation:

1. Understand the request
2. Analyze the requirement
3. Produce a technical design
4. Assess risks and dependencies
5. Break work into tasks
6. Implement code
7. Write or update tests
8. Perform code review
9. Generate API and change documentation
10. Deliver a traceable result

## Start Here

If you are new to the framework, read in this order:

1. [ProjectTypes/README.md](ProjectTypes/README.md)
2. [Standards/README.md](Standards/README.md)
3. [Roles/README.md](Roles/README.md)
4. [Profiles/README.md](Profiles/README.md)
5. [skills/README.md](skills/README.md)
6. [Workflows/README.md](Workflows/README.md)
7. [Templates/README.md](Templates/README.md)
8. [Orchestrator/README.md](Orchestrator/README.md)

## Machine-Readable Entry

The framework also provides a lightweight machine-readable entrypoint:

- `config/framework.json` - framework layers, profiles, skills, workflows, templates, and detection hints
- `schemas/project-context.schema.json` - recommended project context structure
- `scripts/scan_project.sh` - one-time project scanner for real business projects
- `.agents/plugins/marketplace.json` - Codex marketplace entry for GitHub installation

Recommended first run in a business project:

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

This creates:

- `.agent/context.md`
- `.agent/runtime.md`
- `.agent/structure.md`
- `.agent/context.json`

After these files exist, Agent tools should reuse them by default and avoid scanning the whole project on every task.

`.agent/` is a project-local cache directory and should not be committed to business repositories.

## Validation

Run the repository validation script before publishing or installing into another project:

```bash
bash scripts/validate_repository.sh
```

The script checks required files, Markdown headings, machine-specific absolute links, and framework version metadata.

## Usage In Real Projects

For PhpStorm, Qoder, Codex, Claude Code, Cursor, or other Agent-based development tools, use the framework through a project-level `AGENTS.md`.

Read:

- [docs/usage/Using-In-Development-Projects.md](docs/usage/Using-In-Development-Projects.md)
- [docs/usage/Codex-And-Qoder-Plugin.md](docs/usage/Codex-And-Qoder-Plugin.md)
- [docs/usage/examples/AGENTS.example.md](docs/usage/examples/AGENTS.example.md)
- [docs/usage/examples/PHP7.2-ThinkPHP5.1-Project.md](docs/usage/examples/PHP7.2-ThinkPHP5.1-Project.md)

## Quick Map

| Layer | Purpose | Main Entry |
|---|---|---|
| Standards | Engineering rules | `Standards/README.md` |
| Roles | Professional viewpoints | `Roles/README.md` |
| Runtimes | Version constraints | `Runtimes/README.md` |
| ProjectTypes | Business context | `ProjectTypes/README.md` |
| Profiles | Ready-to-use presets | `Profiles/README.md` |
| Skills | Atomic capabilities | `skills/README.md` |
| Workflows | Delivery paths | `Workflows/README.md` |
| Templates | Document structure | `Templates/README.md` |
| Orchestrator | Routing and composition | `Orchestrator/README.md` |

## Layer Cards

### Standards

- 定义编码、注释、日志、安全、测试等统一规则
- 目标是减少风格漂移和质量波动

### Roles

- 定义 PHPDeveloper、ProductManager、Architect、Tester、CodeReviewer 等专业视角
- 目标是让 Agent 在不同任务中使用合适的默认关注点

### Runtimes

- 定义 PHP 和 ThinkPHP 的版本边界
- 目标是不误用语法、不误判框架能力

### ProjectTypes

- 定义 ERP、E-Commerce、OMS、WMS、CRM、Finance、Payment 等业务域
- 目标是让编排器先理解业务语境

### Profiles

- 把标准、运行环境和默认优先级打包成一个可直接使用的配置
- 目标是让老项目和新项目都能快速进入正确模式

### Skills

- 定义需求分析、设计、开发、测试、评审、文档等原子能力
- 目标是把复杂任务拆成可复用模块

### Workflows

- 定义 FeatureDevelopment、BugFix、ApiDevelopment 等交付路径
- 目标是把多个 Skill 串成完整闭环

### Templates

- 定义需求、设计、风险、接口、变更和发布文档结构
- 目标是保证输出稳定、清晰、可追溯

### Orchestrator

- 负责路由、编排和兜底
- 目标是让 Agent 先分析、再设计、再实现、再收口

## Core Philosophy

- Compatibility first.
- Enterprise systems first.
- Minimal change first.
- Reuse existing code before adding new code.
- Document before and after implementation.
- Keep outputs traceable and reviewable.

The framework is organized into eight core layers, with `Profiles` acting as the composition entrypoint:

1. `Standards` - global engineering standards
2. `Roles` - professional viewpoints
3. `Runtimes` - language and framework runtime constraints
4. `ProjectTypes` - business-domain context
5. `Skills` - atomic capabilities
6. `Workflows` - multi-step delivery flows
7. `Templates` - standardized output documents
8. `Orchestrator` - policy-aware workflow coordination

`Profiles` combine standards, runtime constraints, and workflow defaults into ready-to-use presets:

- `PHP5.4-ThinkPHP3`
- `PHP7.2-ThinkPHP5.1`
- `PHP7.4-ThinkPHP5.1`
- `HTML-CSS-JavaScript`

Quick navigation:

- `ProjectTypes/README.md`
- `Standards/README.md`
- `Roles/README.md`
- `Runtimes/README.md`
- `skills/README.md`
- `Profiles/README.md`
- `Workflows/README.md`
- `Templates/README.md`
- `Orchestrator/README.md`
- `Orchestrator/Examples.md`
- `Orchestrator/SkillTemplateMatrix.md`
- `Orchestrator/ProjectTypeWorkflowMatrix.md`
- `Orchestrator/ProfileSkillPriorityMatrix.md`
- `Orchestrator/WorkflowTemplateMatrix.md`
- `Orchestrator/StandardSkillMatrix.md`
- `Orchestrator/CachePolicy.md`
- `Orchestrator/ProjectScanPolicy.md`
- `Orchestrator/RoleSelectionPolicy.md`
- `Orchestrator/ShortcutCommands.md`
- `config/framework.json`
- `schemas/project-context.schema.json`
- `docs/usage/Using-In-Development-Projects.md`
- `docs/usage/Codex-And-Qoder-Plugin.md`
- `docs/usage/examples/AGENTS.example.md`
- `docs/usage/examples/PHP7.2-ThinkPHP5.1-Project.md`
- `Workflows/Examples/README.md`
- `Workflows/Examples/ERP.md`
- `Workflows/Examples/Finance.md`
- `Workflows/Examples/OMS.md`
- `Workflows/Examples/ECommerce.md`

## Architecture Overview

```text
Enterprise AI Software Engineering Framework
├── Standards
├── Roles
├── Runtimes
├── ProjectTypes
├── Skills
├── Workflows
├── Templates
└── Orchestrator
```

## SDLC Workflow

The framework supports multiple workflows, not just a single feature flow.

- Feature Development
- Bug Fix
- Existing Logic Confirmation
- Code Review
- API Development
- Frontend Implementation
- Database Migration

Each workflow may produce different artifacts, for example:

- Requirement analysis
- Technical design
- Risk analysis
- Task breakdown
- Implementation code
- Unit test artifacts
- Code review report
- API documentation
- Change summary

## Standards

Standards are the highest-priority rules. They guide how the agent writes, changes, reviews, and documents code.

Examples:

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

## Runtimes

Runtimes describe the exact software environment.

Current supported baselines:

- PHP 5.4 + ThinkPHP 3
- PHP 7.2 + ThinkPHP 5.1
- PHP 7.4 + ThinkPHP 5.1
- HTML / CSS / JavaScript

The runtime layer exists so the agent does not guess syntax or framework APIs.

## Profiles

Profiles combine standards, runtime constraints, and framework compatibility into one ready-to-use configuration.

When runtime detection is uncertain, the agent must ask for confirmation instead of assuming the newest version.

See also:

- `Profiles/README.md`
- `Templates/README.md`
- `Orchestrator/README.md`

## Skills

Skills are atomic capabilities. They should be small, focused, and reusable.

Examples:

- `RequirementAnalysis`
- `TechnicalDesign`
- `RiskAnalysis`
- `DatabaseDesign`
- `ApiDesign`
- `TaskBreakdown`
- `CodeGeneration`
- `Debugging`
- `UnitTesting`
- `CodeReview`
- `ApiDocumentation`
- `ChangeSummary`

## Workflows

Workflows combine skills into executable delivery paths.

Examples:

- `FeatureDevelopment`
- `BugFix`
- `CodeReview`
- `ApiDevelopment`
- `FrontendImplementation`
- `DatabaseMigration`

Each workflow should define:

- Inputs
- Outputs
- States
- Definition of Done

## Templates

Templates define the required output format for documents.

Examples:

- `RequirementAnalysis`
- `TechnicalDesign`
- `RiskAnalysis`
- `ApiDocumentation`
- `ChangeSummary`
- `ReleaseNote`

## Orchestrator

The Orchestrator is the coordination layer. It decides which profile, standards, skills, and workflow to use based on:

- the user request
- the detected runtime
- the project type
- the available context

The Orchestrator should prefer analysis and documentation before code generation.

Core orchestration documents:

- `Orchestrator/ContextDetection.md`
- `Orchestrator/RoutingPolicy.md`
- `Orchestrator/FallbackPolicy.md`
- `Orchestrator/SkillTemplateMatrix.md`
- `Orchestrator/ProjectTypeWorkflowMatrix.md`
- `Orchestrator/ProfileSkillPriorityMatrix.md`
- `Orchestrator/WorkflowTemplateMatrix.md`
- `Orchestrator/StandardSkillMatrix.md`
- `Orchestrator/RoleSelectionPolicy.md`

Navigation entry points:

- `Profiles/README.md`
- `Workflows/README.md`
- `Workflows/Examples/README.md`
- `Templates/README.md`

## Future Expansion

This repository is intentionally prepared for future expansion.

Planned areas include:

- Java
- Go
- Python
- Laravel
- Spring Boot
- AI workflows
- MCP integration
- RAG-oriented workflows
- release and deployment automation

## Repository Rule

All directory names are English. Document content is Chinese-first to match the target audience and preserve precise engineering meaning.
