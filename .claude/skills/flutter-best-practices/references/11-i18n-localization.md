# 11 · 国际化与本地化（intl）

> 使用 `intl` 处理文案、日期、数字、复数。面向未来多语言，**不要把用户可见文案硬编码**在 Widget 里。
>
> 🚦 **红线**：页面（`screens/`·`widgets/`）里用户可见文案**禁止**出现中/英文字面量，一律走国际化。i18n 基建（`l10n.yaml` + `lib/l10n/*.arb` + `AppLocalizations`）属于 infra，业务 agent 不得自行搭建；缺失时按 `16-agent-workflow.md` 停下询问，由人工先建基建。

## ✅ 应该

- **用户可见文案** 走本地化资源（`intl` 的 `.arb` + 生成的 `AppLocalizations`，或集中 `S` 类），不散落字符串字面量。
- **日期/时间** 用 `DateFormat`（跟随 locale），不手拼格式。
- **数字/货币** 用 `NumberFormat`。
- **复数/性别** 用 `Intl.plural` / `Intl.select`。
- `MaterialApp` 配 `localizationsDelegates` 与 `supportedLocales`。
- 文案 key 语义化：`todo_empty_hint` 而非 `text1`。

## ❌ 避免

- ❌ 在 Widget 里写死中文/英文字面量（除日志/调试）。
- ❌ 手写 `"${d.year}-${d.month}"` 拼日期。
- ❌ 用字符串拼接构造带变量的句子（语序在不同语言不同）——用占位符。

## 📌 日期与数字

```dart
final date = DateFormat.yMMMd().format(todo.dueDate!);   // 跟随 locale
final price = NumberFormat.currency(symbol: "¥").format(19.9);
```

## 📌 复数

```dart
String remaining(int n) => Intl.plural(
      n,
      zero: "全部完成",
      one: "还剩 1 项",
      other: "还剩 $n 项",
    );
```

## 📌 MaterialApp 装配（若启用 gen-l10n）

```dart
MaterialApp.router(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  // ...
);
```

> 若采用 Flutter 官方 `gen-l10n`：新增 `l10n.yaml` 与 `lib/l10n/*.arb`，`flutter gen-l10n` 生成；文案通过 `AppLocalizations.of(context)` 访问。当前仅装了 `intl`，如需完整 i18n 可再引入 `flutter_localizations`（SDK 内置）。
