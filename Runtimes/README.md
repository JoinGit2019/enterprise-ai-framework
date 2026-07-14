# Runtimes

## 说明

Runtimes 用于定义语言、框架、前端运行环境和版本约束，避免 Agent 在不同项目中误用不兼容语法或 API。

## 当前运行环境

- `PHP/PHP5.4`
- `PHP/PHP7.2`
- `PHP/PHP7.4`
- `Frameworks/ThinkPHP3`
- `Frameworks/ThinkPHP5.1`
- `Frontend/HTML`
- `Frontend/CSS`
- `Frontend/JavaScript`

## 使用原则

- 先确认运行环境，再生成代码
- 不确定版本时必须询问用户
- 不默认使用更高版本语法
- 前端代码必须确认浏览器目标和构建环境
- 老项目优先保持兼容性

## TODO

- Future: PHP8.1
- Future: Laravel
- Future: Vue
- Future: React
- Future: Node.js

