# CachePolicy

## 说明

这里定义框架内容的加载缓存策略，避免 Agent 每次任务都完整加载所有文档。

## 核心规则

- 框架版本未变化时，不需要重新完整加载全部内容
- 只加载当前任务需要的 Standards、Profile、Skills、Workflows、Templates 和矩阵
- 当 `VERSION` 变化时，视为框架规则可能变化，需要刷新框架缓存
- 当项目级配置变化时，只刷新项目级上下文，不强制刷新框架规则

## 缓存键

推荐缓存键由以下部分组成：

- framework version: `VERSION`
- framework manifest: `config/framework.json`
- selected profile
- selected project type
- selected workflow
- project fingerprint

## 推荐缓存层级

### Framework Cache

缓存框架自身内容。

触发刷新：

- `VERSION` 变化
- Orchestrator 矩阵变化
- Standards / Profiles / Workflows / Templates 变化

### Project Context Cache

缓存实际业务项目的结构分析结果。

触发刷新：

- 用户主动要求重新扫描
- 项目结构发生明显变化
- 运行环境配置变化
- 关键配置文件变化

### Task Cache

缓存本次任务的路由结果。

触发刷新：

- 用户改变需求
- 用户切换 Profile
- 用户切换 Workflow
- 用户补充新的关键上下文

## 加载策略

默认加载顺序：

1. 读取 `VERSION`
2. 读取 `config/framework.json`
3. 检查 Framework Cache 是否命中
4. 读取项目上下文缓存 `.agent/context.md`、`.agent/runtime.md`、`.agent/structure.md`、`.agent/context.json`
5. 根据任务选择 ProjectType
6. 根据环境选择 Profile
7. 根据目标选择 Workflow
8. 按矩阵加载必要 Skills、Templates 和 Standards

## 禁止行为

- 不要每次任务都完整加载所有文档
- 不要在版本未变化时重复扫描框架目录
- 不要把项目上下文缓存和框架缓存混在一起
- 不要在项目结构未变化时重复做全量项目扫描

## TODO

- Future: framework fingerprint command
- Future: cache invalidation script
