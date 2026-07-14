---
name: sql-review
description: >
  Review SQL, query builders, database access code, indexes, transactions, and
  migration risk. Use when the user says SQL_REVIEW, asks to review SQL,
  optimize queries, check indexes, or assess database risks.
argument-hint: "<file|SQL|query description>"
license: MIT
---

# SQLReview

用于 SQL、查询链路和数据库风险审查。

## 默认行为

- 不修改代码
- 不全量扫描项目
- 只读取目标 SQL、目标文件和必要调用链
- 无法确认表结构或索引时标记为“需确认”

## 检查重点

- 是否存在全表扫描
- 是否缺少必要索引
- 是否存在 `select *`
- 是否存在大分页风险
- 是否存在大事务
- 是否存在锁等待或死锁风险
- 是否存在 SQL 注入风险
- 是否存在不兼容当前 MySQL 版本的语法
- 是否影响历史接口或数据兼容

## 输出要求

- SQL 或查询链路列表
- 风险点
- 索引建议
- 事务和锁风险
- 优化建议
- 待确认问题
