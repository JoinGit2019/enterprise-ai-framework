# CodeReview Example

## 场景

审查一次优惠券功能的变更提交。

## 前置条件

- 工作流：`CodeReview`
- 输入：代码差异、需求背景、运行环境、相关文档

## 标准输出顺序

1. `CodeReview`
2. `ChangeSummary`

## 预期产物

- 评审问题清单
- 风险备注
- 修改建议
- 合并建议
- [ChangeSummary Template](../../Templates/ChangeSummary.md)

## 回退点

- 上下文不足时回到上下文读取
- 问题证据不足时补充检查
- 修复不完整时回到复核

## Definition of Done

- 问题已明确
- 建议可执行
- 是否可合并已说明
