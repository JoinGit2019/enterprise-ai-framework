---
name: bug-fix
description: >
  Diagnose and fix defects using the framework's BugFix workflow. Use when the
  user says BUG, reports an error, asks to troubleshoot, locate root cause, or
  fix an existing behavior.
argument-hint: "<bug description>"
license: MIT
---

# BugFix

用于排查和修复问题。

## 默认流程

1. 读取项目上下文
2. 确认问题现象
3. 定位影响范围
4. 追踪调用链
5. 输出可能根因
6. 给出修复方案
7. 用户确认后再修改代码
8. 补充回归测试建议
9. 输出 ChangeSummary

## 规则

- 不要只修表象，要定位根因
- 不要扩大改动范围
- 不要在未确认版本时使用高版本语法
- 涉及数据、金额、库存、支付、订单状态时必须输出风险分析
