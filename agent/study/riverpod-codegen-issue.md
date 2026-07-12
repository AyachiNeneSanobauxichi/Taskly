# 为什么本仓库不用 `@riverpod` 代码生成（手写 Provider）

> 记录一次真实的依赖冲突：在搭建网络层基建（`agent/infra/network.md` v1）时，尝试按原红线「状态管理只用 `@riverpod` 代码生成」引入 `riverpod_generator`，结果在当前 Flutter 工具链下**无法运行**。本文讲清报错原因、最终决定，以及「如果能用 `@riverpod` 该怎么写、跟现在手写有什么区别」。

## TL;DR

- 当前 Flutter **3.38.3** 自带 `analyzer 8.4.1` / `meta 1.17.0`，且 `flutter_test` **死锁** `meta 1.17.0`。
- `riverpod_generator` 4.x 需要 `analyzer ≥ 9`（→ `meta ≥ 1.18`），与上面直接冲突；就算用 `dependency_overrides` 强升 analyzer 到 9，`riverpod_generator` 的传递依赖（`riverpod_analyzer_utils` / `source_helper`）又调用了只存在于 analyzer 8 的 API，编译直接失败。**两头堵死**。
- 结论：**移除 `riverpod_annotation` + `riverpod_generator`，只保留基础 `flutter_riverpod`，provider/notifier 一律手写**。`freezed` 不受影响（它在 analyzer 8.4.1 上正常生成）。

---

## 一、报错经过（可复现）

### 1) 装 `riverpod_generator` → 版本解不出来

`pubspec.yaml` 加上 `riverpod_generator` 后 `flutter pub get` 报：

```
Because ... riverpod_generator >=4.0.3 <4.0.4-dev.2 depends on riverpod_annotation 4.0.2
which depends on riverpod 3.2.1, flutter_riverpod ^3.3.2 is incompatible with riverpod_generator ...
And because riverpod_generator >=4.0.4-dev.1 depends on analyzer ^12.0.0 which depends on meta ^1.18.0,
... every version of flutter_test from sdk depends on meta 1.17.0 ...
So, because todo_app_v1 depends on both flutter_test from sdk and riverpod_generator ^4.0.3, version solving failed.
```

一路对齐版本（`flutter_riverpod`、`riverpod_annotation` 都往下压）后，冲突收敛成一句本质矛盾：

```
build_runner >=2.4.15 is incompatible with riverpod_generator >=4.0.3
（riverpod_generator 需要 analyzer ^9；而 flutter_test 锁死 meta 1.17.0，analyzer 只能停在 8.x）
```

### 2) 用 `dependency_overrides` 强升 analyzer → 换成编译报错

强行 `dependency_overrides: { analyzer: ^9.0.0, meta: ^1.18.0 }` 后 `pub get` 能过，但 `dart run build_runner build` 编译生成器脚本时炸了：

```
riverpod_analyzer_utils-1.0.0-dev.10/lib/src/nodes.dart:53:44:
  Error: The type 'ClassBody' is not exhaustively matched ... doesn't match 'ClassBodyImpl()'.
source_helper-1.3.8/lib/src/dart_type_extension.dart:18:8:
  Error: Error when reading '.../analyzer-9.0.0/lib/dart/element/element2.dart': No such file or directory
  import 'package:analyzer/dart/element/element2.dart';
source_helper-...: The getter 'element3' isn't defined for the type 'InterfaceType'.
source_helper-...: 'EnumElement2' isn't a type.
Bad state: Generating AOT kernel dill failed!
```

即：这些生成器依赖引用了 analyzer **8.x** 时代的 API（`element2.dart`、`.element3`、`EnumElement2`），它们在 analyzer **9.x** 里已被移除/改名。所以：

- analyzer **停在 8** → `riverpod_generator` 声明 `analyzer ^9`，**装不上**；
- analyzer **升到 9** → 生成器自身的依赖**编译不过**。

无解，遂放弃 `@riverpod` 代码生成。

## 二、根因（一句话）

> **Flutter SDK 的版本地基（analyzer 8.4.1 / meta 1.17.0，由 `flutter_test` 锁死）与 `riverpod_generator` 4.x 的地基（analyzer 9/12、meta 1.18）不在同一代。** 而 `freezed 3.2.3` 恰好兼容 analyzer 8.4.1，所以 Freezed 生成完全正常——**只有 Riverpod 的生成器踩了雷**。

## 三、最终决定

| 项 | 处理 |
| --- | --- |
| `riverpod_annotation` / `riverpod_generator` | **移除** |
| `flutter_riverpod` | 保留 `^3.3.2`（基础运行时，含 `Provider`/`Notifier` 等手写 API） |
| provider / notifier | **一律手写**，不写 `@riverpod`、不生成 `*.g.dart` |
| `freezed` / `json_serializable` | **不变**，继续走 `build_runner` |
| 规范 | 已同步更新 skill（`references/04`、`00`、`12`、`SKILL.md`）、`.cursor/rules/*`、`CLAUDE.md` 红线 #2 |

> 待团队升级 Flutter SDK 到自带 analyzer ≥ 9 / meta ≥ 1.18 且 `riverpod_analyzer_utils` 对齐的版本后，可再评估切回 `@riverpod` 代码生成。

## 四、`@riverpod`（不能用）vs 手写（现在的写法）

功能等价，差别只在**样板由谁生成**：`@riverpod` 由 `build_runner` 生成 `xxxProvider`；手写则自己声明 `final xxxProvider = ...`。运行时 API（`ref.watch`/`read`/`listen`/`AsyncValue`/`AsyncNotifier`）完全一样。

### 1) 依赖注入 / 只读派生（函数式 provider）

```dart
// ❌ @riverpod（本仓库不可用）——需要 part "xxx.g.dart" + build_runner
@riverpod
DioClient dioClient(Ref ref) => DioClient(ref.watch(dioProvider));

// ✅ 手写（现在）——直接声明，无 part、无生成
final dioClientProvider = Provider<DioClient>(
  (ref) => DioClient(ref.watch(dioProvider)),
);
```

### 2) 异步可变状态（AsyncNotifier + CRUD）

```dart
// ❌ @riverpod（不可用）
part "todo_list_controller.g.dart";

@riverpod
class TodoListController extends _$TodoListController {
  @override
  Future<List<Todo>> build() => ref.watch(todoRepositoryProvider).fetchTodos();

  Future<void> add(String title) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).create(title);
      return ref.read(todoRepositoryProvider).fetchTodos();
    });
  }
}

// ✅ 手写（现在）——自己写 provider + 继承 AsyncNotifier（不是 _$xxx）
final todoListControllerProvider =
    AsyncNotifierProvider<TodoListController, List<Todo>>(
  TodoListController.new,
);

class TodoListController extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() => ref.watch(todoRepositoryProvider).fetchTodos();

  Future<void> add(String title) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).create(title);
      return ref.read(todoRepositoryProvider).fetchTodos();
    });
  }
}
```

### 3) 带参数（family）

```dart
// ❌ @riverpod（不可用）——参数自动生成 family
@riverpod
Future<Todo> todoDetail(Ref ref, String id) =>
    ref.watch(todoRepositoryProvider).getById(id);

// ✅ 手写（现在）——用 Provider.family / 对应 NotifierProvider.family
final todoDetailProvider = Provider.family<Future<Todo>, String>(
  (ref, id) => ref.watch(todoRepositoryProvider).getById(id),
);
// 使用都一样：ref.watch(todoDetailProvider("123"))
```

### 关键区别一览

| 维度 | `@riverpod` 代码生成 | 手写（现在） |
| --- | --- | --- |
| provider 变量 | 生成 `xxxProvider`（**不用自己写**） | **自己声明** `final xxxProvider = ...` |
| 文件头 | 需 `part "xxx.g.dart";` + import annotation | **无** `part`、**无** annotation import |
| Notifier 基类 | `extends _$Xxx`（生成的基类） | `extends AsyncNotifier<T>` / `Notifier<T>` |
| family/参数 | provider 函数直接加参数，自动生成 | 用 `Provider.family` / `XxxNotifierProvider.family` 显式声明 |
| 改完是否跑 build_runner | 要 | **不用**（改 provider 无需生成；仅 Freezed/JSON 仍要） |
| 运行时 API | `ref.watch/read/listen`、`AsyncValue`、`AsyncValue.guard`、`ref.onDispose` | **完全相同** |

> 一句话：手写就是把「生成器本会替你写的那行 `final xxxProvider = ...` 和基类」自己敲出来，其余用法零差别。参考实现见 `lib/core/providers/core_providers.dart`。
