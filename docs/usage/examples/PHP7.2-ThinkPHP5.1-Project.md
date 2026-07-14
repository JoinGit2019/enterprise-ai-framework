# PHP7.2-ThinkPHP5.1 Project Example

## 适用场景

该示例用于说明如何在一个 PHP 7.2 + ThinkPHP 5.1 业务项目中接入本框架。

## 推荐目录

```text
your-business-project/
├── AGENTS.md
├── .agent/
├── ai-framework/
├── application/
├── public/
├── think
├── composer.json
└── composer.lock
```

## 第一步：放入框架

推荐将本框架放在业务项目根目录：

```text
ai-framework/
```

多个项目共用时，可以使用 Git Submodule；单项目试用时，也可以直接复制目录。

## 第二步：创建 AGENTS.md

将本目录下的 `AGENTS.example.md` 复制到业务项目根目录，并改名为：

```text
AGENTS.md
```

业务项目中的 Agent、Qoder、Codex、Claude Code、Cursor 或 PhpStorm AI 插件应优先读取该文件。

## 第三步：执行一次项目扫描

在业务项目根目录执行：

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

生成：

```text
.agent/context.md
.agent/runtime.md
.agent/structure.md
.agent/context.json
```

## 第四步：确认 Profile

如果扫描结果确认：

- PHP：7.2
- Framework：ThinkPHP5.1

则使用：

```text
PHP7.2-ThinkPHP5.1
```

如果 PHP 或 ThinkPHP 版本无法确认，不要猜测，应先要求用户确认。

## 第五步：执行需求

新增功能默认使用：

```text
FeatureDevelopment
```

接口开发默认使用：

```text
ApiDevelopment
```

排查问题或确认现有逻辑默认使用：

```text
ExistingLogicConfirmation
```

前端修改默认使用：

```text
FrontendImplementation
```

## 默认加载顺序

1. 读取 `AGENTS.md`
2. 读取 `ai-framework/VERSION`
3. 读取 `ai-framework/config/framework.json`
4. 读取 `.agent/context.md`
5. 读取 `.agent/runtime.md`
6. 读取 `.agent/structure.md`
7. 根据任务加载必要的 Profile、Workflow、Skills、Standards 和 Templates

## 注意事项

- 不要每次任务都全量扫描项目
- 不要每次任务都完整加载框架
- 不要在未确认版本时使用 PHP 7.4 或 PHP 8.x 语法
- 不要在 ThinkPHP5.1 项目中使用 ThinkPHP6 或 ThinkPHP8 写法
- 不要绕过现有 Controller、Service、Model、模板和静态资源结构
- 涉及前端时，优先复用现有组件、模板、样式和 JavaScript 工具
- 样式尽量写入现有 CSS、SCSS、Less 或组件样式文件，不要直接写在 HTML 中

## TODO

- Future: PHP5.4-ThinkPHP3 接入示例
- Future: PHP7.4-ThinkPHP5.1 接入示例
- Future: Laravel 项目接入示例
