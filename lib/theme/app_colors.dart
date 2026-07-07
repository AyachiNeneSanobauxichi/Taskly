import "package:flutter/material.dart";

/// 全局色板：只放"原始颜色值"，不含任何 Widget 逻辑。
/// Widget 里不要直接用这里的常量，而是通过 Theme.of(context).colorScheme 取，
/// 这里只是给 app_theme.dart 组装 ColorScheme 用的"原料"。
abstract final class WsyAppColors {
  // —— 品牌主色 ——
  static const Color primary = Color(0xFF2563EB); // 主色（按钮、强调）
  static const Color primaryDark = Color(0xFF1D4ED8); // 主色的深色态
  static const Color secondary = Color(0xFF7C3AED); // 次要强调色

  // —— 中性色（文字/背景/边框）——
  static const Color background = Color(0xFFF8FAFC); // 页面底色
  static const Color surface = Color(0xFFFFFFFF); // 卡片/输入框底色
  static const Color textPrimary = Color(0xFF0F172A); // 主要文字
  static const Color textSecondary = Color(0xFF64748B); // 次要文字/提示
  static const Color border = Color(0xFFE2E8F0); // 分割线/边框

  // —— 语义状态色 ——
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);

  // —— 深色模式专用中性色 ——
  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkTextPrimary = Color(0xFFF1F5F9);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
}
