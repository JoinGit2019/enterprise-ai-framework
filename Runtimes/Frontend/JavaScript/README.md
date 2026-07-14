# JavaScript

## 说明

JavaScript 运行时约束，适用于原生 JavaScript、jQuery、页面脚本、组件逻辑和简单插件。

## 规则

- 先确认项目是否使用 jQuery、Layui、Bootstrap、Element UI 或其他现有库
- 优先沿用现有事件绑定方式
- 优先复用已有工具函数、请求封装和组件逻辑
- 不默认引入新依赖
- 修改 Ajax 请求时必须确认接口地址、参数和返回结构
- 修改事件逻辑时必须检查重复绑定和动态 DOM 场景
- 不使用当前项目构建环境不支持的语法

## TODO

- Future: jQuery compatibility notes
- Future: Vue and React runtime profiles
