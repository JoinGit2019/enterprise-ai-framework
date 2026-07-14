# ContextDetection

## 说明

编排器首先需要识别当前请求对应的运行环境、项目类型和任务意图。

## 识别顺序

1. 读取用户明确提供的信息
2. 读取项目根目录的环境文件
3. 识别仓库结构和框架特征
4. 识别需求关键词和目标产物
5. 在信息不足时主动询问用户

## 需要识别的内容

### 角色

- PHPDeveloper
- ProductManager
- Architect
- Tester
- CodeReviewer
- FrontendDeveloper

### 运行环境

- PHP 版本
- ThinkPHP 版本
- 其他语言或框架版本
- HTML / CSS / JavaScript 使用方式
- 是否使用 jQuery、Layui、Bootstrap、Vue、React 或其他前端库

### 项目类型

- ERP
- E-Commerce
- OMS
- WMS
- CRM
- Finance
- Payment

### 请求意图

- 需求分析
- 技术设计
- 风险分析
- 现有逻辑确认
- 代码实现
- 单元测试
- 代码评审
- 接口文档
- 变更总结
- 前端页面修改

## 识别原则

- 先识别用户明确说出的信息
- 不能猜测的内容不要猜
- 识别结果不确定时必须标记为待确认
- 旧项目优先使用历史上下文而不是默认新版本

## 常见证据

- `composer.json`
- `composer.lock`
- `application/`
- `ThinkPHP/`
- `vendor/topthink/`
- `README.md`
- `docs/`
- `runtime/`
- `docker-compose.yml`
- `Dockerfile`

## TODO

- Future: automatic runtime detection examples
- Future: project-type inference heuristics
