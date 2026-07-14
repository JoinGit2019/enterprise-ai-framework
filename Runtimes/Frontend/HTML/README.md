# HTML

## 说明

HTML 运行时约束，适用于模板页面、后台页面、静态页面和组件渲染输出。

## 规则

- 保持现有 DOM 结构、模板语法和组件结构兼容
- 表单字段必须与接口参数或状态字段对应
- 不删除模板变量、权限判断、循环结构或渲染条件
- 修改页面结构时必须考虑已有 JS 选择器和 CSS 选择器
- 不随意使用内联样式
- 优先复用已有结构和组件

## TODO

- Future: template syntax examples
- Future: form validation conventions
