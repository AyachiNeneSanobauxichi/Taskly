# 09 · 主题与 UI

> 主题集中在 `lib/theme/`（`app_colors.dart` + `app_theme.dart`）；组件遵循 Material 3；复用组件下沉到 `lib/widgets/`（全局）或 feature 的 `widgets/`（私有）。

## ✅ 应该

- **颜色/间距/圆角** 集中定义（`AppColors` + `ThemeData`），Widget 通过 `Theme.of(context)` 取值，不散落魔法值。
- **Material 3**：`ThemeData(useMaterial3: true, colorScheme: ...)`，支持 `light`/`dark`。
- **文本样式** 用 `Theme.of(context).textTheme`，不硬编码 `TextStyle(fontSize: 14)` 到处写。
- **组件拆分**：`build` 过长时拆成小 Widget（class 优先于返回 Widget 的方法，利于 const 与重建优化）。
- **const 化**：静态子树尽量 `const`。
- **列表** 用 `ListView.builder` / `SliverList` 懒加载；给 item 稳定 `key`。
- **网络图** 用 `CachedNetworkImage`，配 `placeholder` 与 `errorWidget`。
- **响应式**：用 `LayoutBuilder` / `MediaQuery` 适配，避免写死尺寸。
- **无障碍**：交互控件提供 `Semantics`/`tooltip`，可点区域 ≥ 48dp。

## ❌ 避免

- ❌ 硬编码颜色 `Color(0xFF...)`、字号、间距散落各处。
- ❌ 用 `MediaQuery.of(context).size` 做绝对像素布局。
- ❌ 在 `build` 里创建 controller/大对象（应在 `initState`/provider）。
- ❌ 用 `Column` + 大量子项代替可滚动懒加载列表。
- ❌ 业务逻辑写进 Widget。

## 📌 颜色与主题

```dart
// lib/theme/app_colors.dart
abstract final class AppColors {
  static const primary = Color(0xFF2563EB);
  static const surface = Color(0xFFFFFFFF);
  static const error = Color(0xFFDC2626);
}
```

```dart
// lib/theme/app_theme.dart
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
      );
}
```

## 📌 复用组件（含语义化 + const）

```dart
// lib/widgets/primary_button.dart
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, this.onPressed, this.loading = false});

  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
          : Text(label),
    );
  }
}
```

## 📌 间距规范（建议 4 的倍数）

```dart
abstract final class Spacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}
```
