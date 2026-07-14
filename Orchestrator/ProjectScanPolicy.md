# ProjectScanPolicy

## 说明

这里定义 Agent 放入实际业务项目后，第一次应该如何读取项目结构，以及后续什么时候需要重新扫描。

## 核心规则

- 第一次进入实际项目时，必须先读取项目结构
- 项目结构扫描结果应缓存
- 后续任务默认复用项目结构缓存
- 除非用户主动要求或关键结构变化，不重复全量扫描

## 第一次扫描内容

### 基础结构

- 根目录文件
- 模块目录
- `composer.json`
- `composer.lock`
- `application/`
- `ThinkPHP/`
- `vendor/topthink/`
- `README.md`
- `docs/`
- `Dockerfile`
- `docker-compose.yml`

### 运行环境

- PHP 版本
- ThinkPHP 版本
- MySQL 版本
- Redis 版本
- 是否使用 Composer
- 是否使用命名空间

### 业务结构

- Controller 层
- Service 层
- Model 层
- Repository / DAO 层
- Middleware
- Commands / Cron
- Queue / Job
- Template / View / Component
- Public assets
- JavaScript
- CSS
- Static resources

### 默认排除

- `.git/`
- `.agent/`
- `.idea/`
- `vendor/`
- `node_modules/`
- `ai-framework/`

### 规范线索

- `AGENTS.md`
- `.agent/`
- `docs/`
- 项目 README
- 现有代码风格
- 接口返回结构
- 日志写法
- 异常处理方式
- 前端模板或组件写法
- JS 事件绑定方式
- CSS 命名和作用域

## 扫描产物

建议生成项目级缓存文档：

```text
.agent/context.md
.agent/runtime.md
.agent/structure.md
.agent/context.json
```

推荐使用框架内置脚本生成：

```bash
bash ai-framework/scripts/scan_project.sh . --write
```

如果只想预览扫描结果，不写入业务项目：

```bash
bash ai-framework/scripts/scan_project.sh .
```

如果实际项目不允许写入，可以将扫描结果保存在当前会话上下文中。

## JSON 上下文

`.agent/context.json` 面向自动化工具、IDE 插件和后续脚本读取。

Markdown 产物面向人类和 Agent 阅读，JSON 产物面向程序读取。两者内容应保持一致。

## 重新扫描条件

- 用户明确要求重新扫描
- 切换分支或切换项目
- `composer.json` 或框架配置变化
- 主要目录结构变化
- 新增或删除核心模块
- 任务涉及未扫描过的模块

## 禁止行为

- 不要每次需求都全量读取整个项目
- 不要在未确认版本时使用高版本语法
- 不要忽略项目已有结构直接套用通用模板
- 不要把一次任务中的临时结论写成长期项目事实

## TODO

- Future: Monorepo 多应用扫描
- Future: 更精确识别 Laravel、Spring Boot、Go、Python 项目
