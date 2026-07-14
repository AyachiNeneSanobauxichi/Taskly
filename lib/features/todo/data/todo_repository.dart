import "package:todo_app_v1/core/error/index.dart";
import "package:todo_app_v1/features/todo/data/dto/index.dart";
import "package:todo_app_v1/features/todo/data/todo_remote_data_source.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

/// Todo 仓库：负责 DTO→Entity 映射，并把底层 [AppException] 统一转成面向 UI 的
/// [Failure] 抛出。上层（controller）只依赖本类，不接触 DataSource / DTO / Dio。
class TodoRepository {
  const TodoRepository(this._remote);

  final TodoRemoteDataSource _remote;

  /// 创建任务，返回新建后的完整任务。
  Future<Todo> create({
    required String name,
    required String content,
    required TodoType type,
    required TodoStatus status,
  }) => _guard(() async {
    final json = await _remote.create(
      CreateTodoRequestDto(
        name: name,
        content: content,
        type: type,
        status: status,
      ),
    );
    return TodoDto.fromJson(json).toEntity();
  });

  /// 更新任务（[id] 定位，其余按需传），返回更新后的任务。
  Future<Todo> update({
    required String id,
    String? name,
    String? content,
    TodoType? type,
    TodoStatus? status,
  }) => _guard(() async {
    final json = await _remote.update(
      UpdateTodoRequestDto(
        id: id,
        name: name,
        content: content,
        type: type,
        status: status,
      ),
    );
    return TodoDto.fromJson(json).toEntity();
  });

  /// 删除任务，返回被删除的任务快照。
  Future<Todo> delete(String id) =>
      _guard(() async => TodoDto.fromJson(await _remote.delete(id)).toEntity());

  /// 获取任务详情。
  Future<Todo> detail(String id) =>
      _guard(() async => TodoDto.fromJson(await _remote.detail(id)).toEntity());

  /// 分页查询任务列表。
  Future<TodoPage> list(TodoListQuery query) => _guard(() async {
    final json = await _remote.list(
      TodoListRequestDto(
        pageNumber: query.pageNumber,
        pageSize: query.pageSize,
        todoName: query.name,
        todoType: query.type,
        todoStatus: query.status,
        sortBy: query.sortField,
        sortOrder: query.sortOrder,
      ),
    );
    return TodoListResponseDto.fromJson(json).toEntity();
  });

  /// 统一异常收敛：底层抛的 [AppException] 转成 [Failure] 再抛出（解析异常等
  /// 非 AppException 原样上抛）。与 AuthRepository 同构。
  Future<T> _guard<T>(Future<T> Function() run) async {
    try {
      return await run();
    } on AppException catch (e) {
      throw e.toFailure();
    }
  }
}
