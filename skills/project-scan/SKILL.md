---
name: project-scan
description: >
  Scan a real project once and generate .agent context files. Use when the user
  says PROJECT_SCAN, asks to initialize project context, refresh .agent files,
  or run the Enterprise AI Framework project scanner.
argument-hint: "[project root]"
license: MIT
---

# ProjectScan

用于生成或刷新项目上下文。

## 默认命令

在业务项目根目录执行：

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

## 生成文件

- `.agent/context.md`
- `.agent/runtime.md`
- `.agent/structure.md`
- `.agent/context.json`

## 规则

- 只有第一次进入项目、项目结构变化、运行环境变化或用户明确要求时才重新扫描
- 不要每次任务都扫描
- 扫描后后续任务默认复用 `.agent/` 上下文
