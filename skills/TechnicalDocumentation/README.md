# TechnicalDocumentation

## 说明

用于把项目中现存的功能、模块或子系统，基于真实代码整理成一份结构化、可交付的技术文档。

这个 Skill 的重点是“整合与输出”：先读懂现状，再形成体系化的技术说明，供新人上手、交接、存档和评审使用。默认不修改代码。

## 适用场景

- 梳理某个现有功能或模块，形成完整技术文档
- 为交接、存档、评审或新人上手沉淀技术资料
- 把分散在代码中的架构、流程、数据和依赖整合成一份说明
- 在已有 `ExistingLogicAnalysis` 结果基础上，输出正式技术文档

## 与其它 Skill 的边界

- `TechnicalDesign`：面向实现“前”的方案设计，回答“要怎么做”
- `ExistingLogicAnalysis`：面向现状的事实确认与排查，回答“当前怎么实现、有没有疑点”
- `TechnicalDocumentation`：面向现状的整合输出，产出一份完整可交付的技术文档

## 输入

- 目标功能、模块或子系统范围
- 相关代码上下文（Controller、Service、Model、Command、Job、路由、脚本等）
- `.agent/` 项目上下文缓存
- 可选：已有的 `ExistingLogicAnalysis` 或 `TechnicalDesign` 结果

## 输出

- 文档概述与读者对象
- 背景与业务场景
- 架构与模块划分（含代码入口）
- 核心流程与调用链
- 数据模型
- 关键业务规则与边界条件
- 外部依赖
- 运行与部署
- 已知问题与风险
- 待确认事项
- 参考代码入口清单

## 关键规则

- 必须基于真实代码，不臆造未验证的实现
- 无法确认的信息必须标记为“需确认”
- 默认不修改代码
- 文档必须落地为 `.md` 文件并写入 `outputs/` 目录
- 区分“当前实现如此”和“业务应该如此”

## 必填项

- 文档概述与读者对象
- 架构与模块划分
- 核心流程与调用链
- 数据模型
- 关键业务规则与边界条件
- 外部依赖
- 待确认事项
- 参考代码入口清单

## 输出落地

- 技术文档必须落地为 `.md` 文件，写入仓库根目录的 `outputs/` 目录。
- 推荐路径：`outputs/tech-doc/<module-or-feature>.md`。
- `outputs/` 已被 `.gitignore` 忽略，clone 后可能不存在，写入前必须先执行 `mkdir -p outputs/tech-doc` 创建目录。
- 目录已存在时不要删除或覆盖已有内容，只新增或更新目标文档文件。
- 落地完成后必须回报最终文件路径。

## 输出要求

- 文档必须能让没有读过代码的人理解该功能或模块
- 架构、流程、数据和依赖必须完整且可追溯
- 关键结论必须能对应到实际代码入口
- 无法确认的部分必须显式标记
- 文档必须已落地到 `outputs/` 目录

## TODO

- Future: mermaid diagram helpers
- Future: architecture decision records link
- Future: multi-module documentation index
