---
name: api-documentation
description: >
  Generate API documentation from controllers, routes, request parameters,
  service calls, response helpers, and existing API behavior.
argument-hint: "<controller file|route|module>"
license: MIT
---

# ApiDocumentation

先阅读本目录 `README.md`，并生成 Markdown 接口文档。

默认不修改代码，无法确认的信息标记为“需确认”。

## 输出落地

生成的接口文档必须落地为 `.md` 文件，写入仓库根目录的 `outputs/` 目录。

- 目标路径：`outputs/api/<module-or-controller>.md`
- `outputs/` 已被 `.gitignore` 忽略，clone 后可能不存在，因此写入文件前必须先创建目录：`mkdir -p outputs/api`
- 目录已存在时不要删除或覆盖目录内容，只新增或更新目标文档文件。
- 写入完成后，向用户回报最终落地的文件路径。
