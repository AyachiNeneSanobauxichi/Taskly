import "package:flutter/material.dart";
import "app_colors.dart";

abstract final class WsyAppTextStyles {
  static const TextTheme lightTextTheme = TextTheme(
    // 大标题：
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.3, // 行高 = fontSize * 1.3
      color: WsyAppColors.textPrimary,
    ),

    // 正文：
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: WsyAppColors.textPrimary,
    ),

    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 1.4,
      color: WsyAppColors.textSecondary,
    ),

    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );

  static const TextTheme darkTextTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.3,
      color: WsyAppColors.darkTextPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.5,
      color: WsyAppColors.darkTextPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 1.4,
      color: WsyAppColors.darkTextSecondary,
    ),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );
}
