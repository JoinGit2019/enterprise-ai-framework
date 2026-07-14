# ProjectContext Template

## 用途

该模板用于保存 Agent 第一次进入实际项目后的结构扫描结果，避免每次任务都重复读取整个项目。

## 推荐产物

- `.agent/context.md`
- `.agent/runtime.md`
- `.agent/structure.md`
- `.agent/context.json`

## 使用原则

- 第一次进入项目时生成
- 后续任务默认复用
- 用户要求重新扫描时刷新
- 运行环境、核心目录或框架配置变化时刷新
- 自动化工具优先读取 `.agent/context.json`
- 人工审查和模型理解优先读取 Markdown 产物

## TODO

- Future: 追加 IDE 插件读取示例
- Future: 追加多项目 Monorepo 扫描规则
