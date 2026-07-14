# Route

这个文档用于路由的编写

## v1

- 完成路由基建
- 首页先使用文字占位
- 需要一个 测试 按钮 返回登录
- 先完成 login 和 register 部分的路由
- 登录需要跳到 register 和 首页

## v2

- 任务列表页承载 home 路由（`/home`）：登录后主页即任务列表，移除原首页文字占位（HomeScreen）改由 TodoListScreen 承载；登出入口移到列表页 AppBar
- 新增任务详情路由 `todoDetail`（path `/todo/:id`）：列表点击任务名 `pushNamed(RouteName.todoDetail, pathParameters: {"id": ...})` 进入
