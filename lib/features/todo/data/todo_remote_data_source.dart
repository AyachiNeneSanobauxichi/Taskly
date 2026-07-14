import "package:todo_app_v1/core/network/index.dart";
import "package:todo_app_v1/features/todo/data/dto/index.dart";

/// Todo 远程数据源：只发原始请求、拿信封解包后的 `data`（Map），**不做领域映射**。
///
/// DTO→Entity 映射与「技术异常 → 领域 Failure」的转换都在 [TodoRepository] 完成
/// （skill 05 / 08）。这里保持纯粹：一个方法对应一个端点。所有端点均需鉴权头，
/// 由 AuthInterceptor 注入。
class TodoRemoteDataSource {
  const TodoRemoteDataSource(this._client);

  final DioClient _client;

  static const String _create = "/todo/create";
  static const String _update = "/todo/update";
  static const String _list = "/todo/todo-list";

  // delete / detail 通过 URL 路径参数传 id（契约已确认）。
  String _deletePath(String id) => "/todo/delete/$id";
  String _detailPath(String id) => "/todo/todo-detail/$id";

  Future<Map<String, dynamic>> create(CreateTodoRequestDto body) =>
      _client.post<Map<String, dynamic>>(_create, data: body.toJson());

  Future<Map<String, dynamic>> update(UpdateTodoRequestDto body) =>
      _client.patch<Map<String, dynamic>>(_update, data: body.toJson());

  Future<Map<String, dynamic>> delete(String id) =>
      _client.delete<Map<String, dynamic>>(_deletePath(id));

  Future<Map<String, dynamic>> detail(String id) =>
      _client.get<Map<String, dynamic>>(_detailPath(id));

  Future<Map<String, dynamic>> list(TodoListRequestDto body) =>
      _client.post<Map<String, dynamic>>(_list, data: body.toJson());
}
