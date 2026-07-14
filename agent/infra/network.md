# network

这个文档编写 network 相关的基建

## v1

- 封装一套网络请求 api 相关架构
- 我的环境暂时先连 http://localhost:3000/ 全局的请求有前缀为 api
- 返回值格式为

```json
{
  "code": 0,
  "message": "success",
  "data": {} // 实际数据
}

// 错误的返回
{
    "code": 11001, // 业务错误码
    "message": "Invalid token", // 错误信息
    "data": null
}
```

- token 携带为请求头中的 Authorization 值需要拼接 Bearer
- 请一步一步教我应该怎样完成构建

## v2

- 修改 .env 文件和 exmple 需要一个 base url 还有一个全局的 prefix 拼接后才是真正请求的接口地址
