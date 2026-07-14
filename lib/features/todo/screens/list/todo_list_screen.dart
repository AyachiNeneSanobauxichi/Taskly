import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:todo_app_v1/app/router/index.dart";
import "package:todo_app_v1/core/error/index.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/features/todo/controllers/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 任务列表页（承载 home 路由）：搜索 + 类型/状态筛选（各项可清空）+ 下拉刷新 +
/// 上拉加载，列表项支持进详情 / 编辑 / 删除，右下角新建。AppBar 提供登出入口。
class TodoListScreen extends ConsumerStatefulWidget {
  const TodoListScreen({super.key});

  @override
  ConsumerState<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  // 已生效的筛选维度（区别于搜索框「输入中」的文本）。
  String _submittedName = "";
  TodoType? _type;
  TodoStatus? _status;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  TodoListController get _controller =>
      ref.read(todoListControllerProvider.notifier);

  /// 接近底部时触发上拉加载（控制器内部已做「无更多 / 加载中」的防重）。
  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - WsyAppSpacing.xxl * 4) {
      _guarded(() => _controller.loadMore());
    }
  }

  /// 以当前生效的三个维度重新查询。
  void _reapply() => _guarded(
    () => _controller.applyFilters(
      name: _submittedName.isEmpty ? null : _submittedName,
      type: _type,
      status: _status,
    ),
  );

  void _onSearchSubmitted() {
    setState(() => _submittedName = _searchController.text.trim());
    _reapply();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _submittedName = "");
    _reapply();
  }

  void _clearAll() {
    _searchController.clear();
    setState(() {
      _submittedName = "";
      _type = null;
      _status = null;
    });
    _reapply();
  }

  /// 统一执行需提示错误的异步动作：失败以 SnackBar 展示，避免未捕获异常。
  Future<void> _guarded(Future<void> Function() action) async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    try {
      await action();
    } on Object catch (e) {
      if (!mounted) return;
      final msg = e is Failure ? e.displayMessage : l10n.todoLoadError;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  Future<void> _logout() =>
      _guarded(() => ref.read(authControllerProvider.notifier).logout());

  Future<void> _confirmDelete(Todo todo) async {
    // 首个 await 前捕获依赖 context 的对象，后续只用捕获值。
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.todoDeleteTitle),
        content: Text(l10n.todoDeleteMessage(todo.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.todoActionDelete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await _controller.delete(todo.id);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.todoDeleteSuccess)));
    } on Object catch (e) {
      final msg = e is Failure ? e.displayMessage : l10n.todoLoadError;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    }
  }

  /// 打开筛选弹层，应用后更新生效维度并重查。
  Future<void> _openFilterSheet() async {
    final result = await showTodoFilterSheet(
      context,
      type: _type,
      status: _status,
    );
    if (result == null || !mounted) return;
    setState(() {
      _type = result.type;
      _status = result.status;
    });
    _reapply();
  }

  void _openDetail(Todo todo) =>
      context.pushNamed(RouteName.todoDetail, pathParameters: {"id": todo.id});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final listState = ref.watch(todoListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.todoListTitle),
        actions: [
          IconButton(
            tooltip: l10n.todoLogout,
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTodoEditSheet(context),
        tooltip: l10n.todoNewTask,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                WsyAppSpacing.md,
                WsyAppSpacing.sm,
                WsyAppSpacing.md,
                WsyAppSpacing.sm,
              ),
              child: Column(
                spacing: WsyAppSpacing.sm,
                children: [
                  Row(
                    spacing: WsyAppSpacing.sm,
                    children: [
                      Expanded(
                        child: TodoSearchBar(
                          controller: _searchController,
                          onSubmitted: (_) => _onSearchSubmitted(),
                          onCleared: _clearSearch,
                        ),
                      ),
                      IconButton.filledTonal(
                        tooltip: l10n.todoFilters,
                        icon: const Icon(Icons.tune),
                        onPressed: _openFilterSheet,
                      ),
                    ],
                  ),
                  _ActiveFilters(
                    name: _submittedName,
                    type: _type,
                    status: _status,
                    onClearName: _clearSearch,
                    onClearType: () {
                      setState(() => _type = null);
                      _reapply();
                    },
                    onClearStatus: () {
                      setState(() => _status = null);
                      _reapply();
                    },
                    onClearAll: _clearAll,
                  ),
                ],
              ),
            ),
            Expanded(
              child: listState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => _ErrorView(onRetry: _controller.refresh),
                data: (state) => _TodoList(
                  state: state,
                  scrollController: _scrollController,
                  onRefresh: _controller.refresh,
                  onTapItem: _openDetail,
                  onEditItem: (todo) => showTodoEditSheet(context, todo: todo),
                  onDeleteItem: _confirmDelete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 生效筛选的可删除标签行：每个维度一枚 chip（点 ✕ 单独清空），末尾一键清除全部。
/// 无任何生效筛选时不占位。
class _ActiveFilters extends StatelessWidget {
  const _ActiveFilters({
    required this.name,
    required this.type,
    required this.status,
    required this.onClearName,
    required this.onClearType,
    required this.onClearStatus,
    required this.onClearAll,
  });

  final String name;
  final TodoType? type;
  final TodoStatus? status;
  final VoidCallback onClearName;
  final VoidCallback onClearType;
  final VoidCallback onClearStatus;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasName = name.isNotEmpty;
    final hasAny = hasName || type != null || status != null;
    if (!hasAny) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: WsyAppSpacing.sm,
        runSpacing: WsyAppSpacing.xs,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (hasName)
            InputChip(label: Text('"$name"'), onDeleted: onClearName),
          if (type != null)
            InputChip(label: Text(type!.label(l10n)), onDeleted: onClearType),
          if (status != null)
            InputChip(
              label: Text(status!.label(l10n)),
              onDeleted: onClearStatus,
            ),
          TextButton(onPressed: onClearAll, child: Text(l10n.todoClearFilters)),
        ],
      ),
    );
  }
}

/// 列表主体：下拉刷新 + 列表 + 底部加载更多指示。
class _TodoList extends StatelessWidget {
  const _TodoList({
    required this.state,
    required this.scrollController,
    required this.onRefresh,
    required this.onTapItem,
    required this.onEditItem,
    required this.onDeleteItem,
  });

  final TodoListState state;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;
  final void Function(Todo) onTapItem;
  final void Function(Todo) onEditItem;
  final void Function(Todo) onDeleteItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    if (state.items.isEmpty) {
      // 空态也要能下拉刷新：用可滚动容器包裹。
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          children: [
            const SizedBox(height: WsyAppSpacing.xxl * 3),
            Icon(
              Icons.checklist_rounded,
              size: WsyAppSpacing.xxl,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: WsyAppSpacing.sm),
            Center(
              child: Text(
                l10n.todoEmpty,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(
          WsyAppSpacing.md,
          WsyAppSpacing.sm,
          WsyAppSpacing.md,
          WsyAppSpacing.md,
        ),
        // 末尾多一行：有下一页时展示加载指示。
        itemCount: state.items.length + (state.hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= state.items.length) {
            return const Padding(
              padding: EdgeInsets.all(WsyAppSpacing.md),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final todo = state.items[index];
          return TodoListItem(
            todo: todo,
            onTap: () => onTapItem(todo),
            onEdit: () => onEditItem(todo),
            onDelete: () => onDeleteItem(todo),
          );
        },
      ),
    );
  }
}

/// 整页错误态：提示 + 重试按钮。
class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: WsyAppSpacing.md,
        children: [
          Text(l10n.todoLoadError),
          FilledButton(onPressed: onRetry, child: Text(l10n.commonRetry)),
        ],
      ),
    );
  }
}
