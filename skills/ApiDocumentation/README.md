# ApiDocumentation

## 说明

生成或更新接口文档。

## 适用场景

- 新增接口
- 接口参数变化
- 返回结构变化
- 文档补全

## 输入

- 接口设计
- 代码实现
- 响应示例
- 错误码

## 输出

- Markdown 接口文档
- OpenAPI 结构草案
- 示例请求与响应

## 输出落地

- Markdown 接口文档必须落地为 `.md` 文件，写入仓库根目录的 `outputs/` 目录。
- 推荐路径：`outputs/api/<module-or-controller>.md`。
- `outputs/` 已被 `.gitignore` 忽略，clone 后可能不存在，写入前必须先执行 `mkdir -p outputs/api` 创建目录。
- 目录已存在时不要删除或覆盖已有内容，只新增或更新目标文档文件。
- 落地完成后必须回报最终文件路径。

## 关键规则

- 文档必须与代码一致
- 参数和返回值必须写清楚
- 错误码必须可理解

## 必填项

- Markdown 接口文档
- OpenAPI 结构草案
- 示例请求与响应

## 输出要求

- 文档必须能被测试或联调直接使用
- 参数、返回值和错误码必须完整
- 文档必须与实现保持一致
- 文档必须已落地到 `outputs/` 目录

## TODO

- Future: Swagger, Apifox, and YAPI exports
