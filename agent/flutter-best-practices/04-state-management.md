# 04 · 状态管理（Riverpod 3 · 代码生成）

> 使用 `flutter_riverpod` 3.x + `riverpod_annotation` 4.x。**统一用 `@riverpod` 注解 + 代码生成**，不手写 `StateProvider/StateNotifierProvider`。

## Provider 选型

| 需求 | 写法 |
| --- | --- |
| 依赖注入（Repository、Service） | 函数式 `@riverpod Xxx foo(Ref ref)` |
| 只读派生值 | 函数式 provider |
| 可变 + 异步状态（列表加载、CRUD） | `@riverpod class Xxx extends _$Xxx` 返回 `Future<T>` |
| 可变 + 同步状态（表单） | `@riverpod class Xxx extends _$Xxx` 返回 `T` |
| 需要参数 | provider 加参数（生成 family） |

## ✅ 应该

- **入口** `runApp` 外层包 `ProviderScope`。
- **Widget** 继承 `ConsumerWidget` / `ConsumerStatefulWidget`，用 `ref.watch` 订阅、`ref.read` 触发动作。
- **异步状态** 用 `AsyncValue<T>`，在 UI 用 `.when(data/loading/error)` 渲染。
- **修改异步状态** 用 `AsyncValue.guard`，自动捕获异常为 `AsyncError`。
- **释放资源** 用 `ref.onDispose(...)`。
- **跨 provider 依赖** 用 `ref.watch(otherProvider)`。
- 每次改动 provider 注解后运行 `build_runner`（见 `12-code-generation.md`）。

## ❌ 避免

- ❌ 在 `build` 方法里 `ref.read`（应 `watch`，`read` 只用于回调/事件处理）。
- ❌ 在 Widget `build` 里做副作用（导航、SnackBar）——用 `ref.listen`。
- ❌ 手写 `.g.dart` 或手动 `StateNotifier` 样板。
- ❌ 把整个巨型对象放一个 provider 导致过度重建——按关注点拆分。
- ❌ 用全局单例/静态变量代替 provider。

## 📌 AsyncNotifier（异步可变状态）

```dart
// lib/features/todo/controllers/todo_list_controller.dart
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "todo_list_controller.g.dart";

@riverpod
class TodoListController extends _$TodoListController {
  @override
  Future<List<Todo>> build() {
    return ref.watch(todoRepositoryProvider).fetchTodos();
  }

  Future<void> add(String title) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).create(title);
      return ref.read(todoRepositoryProvider).fetchTodos();
    });
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
```

## 📌 函数式 provider（依赖注入 / 派生）

```dart
@riverpod
TodoRepository todoRepository(Ref ref) =>
    TodoRepositoryImpl(ref.watch(dioClientProvider));

@riverpod
int uncompletedCount(Ref ref) {
  final todos = ref.watch(todoListControllerProvider).valueOrNull ?? const [];
  return todos.where((t) => !t.completed).length;
}
```

## 📌 UI 中处理副作用（listen）

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  ref.listen(todoListControllerProvider, (prev, next) {
    if (next case AsyncError(:final error)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    }
  });
  final todos = ref.watch(todoListControllerProvider);
  return todos.when(
    data: (list) => TodoListView(items: list),
    loading: () => const LoadingView(),
    error: (e, _) => ErrorView(message: e.toString()),
  );
}
```

## 📌 带参数（family）

```dart
@riverpod
Future<Todo> todoDetail(Ref ref, String id) {
  return ref.watch(todoRepositoryProvider).getById(id);
}
// 使用：ref.watch(todoDetailProvider("123"))
```
