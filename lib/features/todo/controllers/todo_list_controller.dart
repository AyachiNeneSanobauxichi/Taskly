import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:todo_app_v1/features/todo/controllers/todo_detail_provider.dart";
import "package:todo_app_v1/features/todo/controllers/todo_list_state.dart";
import "package:todo_app_v1/features/todo/controllers/todo_providers.dart";
import "package:todo_app_v1/features/todo/data/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

/// 任务列表控制器：承载分页拉取、下拉刷新、上拉加载、搜索/筛选，以及删除/编辑
/// 后的本地状态同步。失败以 [Failure] 上抛，由页面本地捕获提示（不污染整页状态）。
final todoListControllerProvider =
    AsyncNotifierProvider<TodoListController, TodoListState>(
      TodoListController.new,
    );

class TodoListController extends AsyncNotifier<TodoListState> {
  TodoRepository get _repo => ref.read(todoRepositoryProvider);

  /// 默认查询：第 1 页、按创建时间倒序；不指定 status（列表默认展示全部非删除项）。
  static const TodoListQuery _defaultQuery = TodoListQuery(
    pageNumber: 1,
    pageSize: 20,
    sortField: TodoSortField.createdAt,
    sortOrder: TodoSortOrder.desc,
  );

  @override
  Future<TodoListState> build() => _fetchFirstPage(_defaultQuery);

  /// 拉取第一页并组装初始状态（刷新 / 筛选变更共用）。
  Future<TodoListState> _fetchFirstPage(TodoListQuery query) async {
    final firstPageQuery = query.copyWith(pageNumber: 1);
    final page = await _repo.list(firstPageQuery);
    return TodoListState(
      items: _visible(page.items),
      query: firstPageQuery,
      hasNextPage: page.hasNextPage,
    );
  }

  /// 过滤掉已删除项：状态筛选不提供 deleted，未选状态时也不应冒出已删除任务。
  /// TODO(todo): 理想由后端列表接口原生排除 deleted；当前在客户端兜底过滤，
  ///   可能导致单页可见条数少于 pageSize（分页游标仍以后端为准，不影响加载更多）。
  List<Todo> _visible(List<Todo> items) =>
      items.where((t) => t.status != TodoStatus.deleted).toList();

  /// 下拉刷新：保留当前查询条件，静默重取第一页（不置整页 loading，转圈交给
  /// RefreshIndicator）。失败上抛给页面提示。
  Future<void> refresh() async {
    final query = state.value?.query ?? _defaultQuery;
    state = AsyncData(await _fetchFirstPage(query));
  }

  /// 上拉加载下一页：无更多 / 正在加载 / 无数据时忽略。失败回滚加载标记并上抛。
  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasNextPage || current.isLoadingMore) {
      return;
    }
    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final nextPage = current.query.pageNumber + 1;
      final page = await _repo.list(
        current.query.copyWith(pageNumber: nextPage),
      );
      state = AsyncData(
        current.copyWith(
          items: [...current.items, ..._visible(page.items)],
          query: current.query.copyWith(pageNumber: nextPage),
          hasNextPage: page.hasNextPage,
          isLoadingMore: false,
        ),
      );
    } on Object {
      state = AsyncData(current.copyWith(isLoadingMore: false));
      rethrow;
    }
  }

  /// 应用搜索 / 筛选：合并到当前查询并回到第一页重取。传 null 表示清除该维度。
  Future<void> applyFilters({
    String? name,
    TodoType? type,
    TodoStatus? status,
  }) async {
    final base = state.value?.query ?? _defaultQuery;
    final query = base.copyWith(
      pageNumber: 1,
      name: (name != null && name.isEmpty) ? null : name,
      type: type,
      status: status,
    );
    // 不显式置 loading：await 期间保留旧列表，新数据到达后一次性替换，避免筛选闪空。
    state = await AsyncValue.guard(() => _fetchFirstPage(query));
  }

  /// 删除任务：调接口成功后从本地列表移除。失败上抛给页面提示。
  Future<void> delete(String id) async {
    await _repo.delete(id);
    final current = state.value;
    if (current == null) return;
    state = AsyncData(
      current.copyWith(items: current.items.where((t) => t.id != id).toList()),
    );
  }

  /// 保存编辑：更新成功后就地替换列表项并刷新详情缓存，返回最新实体供调用方使用。
  Future<Todo> save({
    required String id,
    required String name,
    required String content,
    required TodoType type,
    required TodoStatus status,
  }) async {
    final updated = await _repo.update(
      id: id,
      name: name,
      content: content,
      type: type,
      status: status,
    );
    final current = state.value;
    if (current != null) {
      final items = _visible([
        for (final t in current.items)
          if (t.id == id) updated else t,
      ]);
      state = AsyncData(current.copyWith(items: items));
    }
    // 详情页可能同时打开：使其重取，保证两处一致。
    ref.invalidate(todoDetailProvider(id));
    return updated;
  }

  /// 新建任务：成功后插入列表顶部（与默认「按创建时间倒序」一致）。失败上抛。
  Future<Todo> create({
    required String name,
    required String content,
    required TodoType type,
    required TodoStatus status,
  }) async {
    final created = await _repo.create(
      name: name,
      content: content,
      type: type,
      status: status,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(
        current.copyWith(items: _visible([created, ...current.items])),
      );
    }
    return created;
  }
}
