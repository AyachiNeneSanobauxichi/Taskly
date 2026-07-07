import "package:flutter/material.dart";
import "index.dart";

abstract final class WsyAppTheme {
  static ThemeData get light {
    const wsyColorScheme = ColorScheme.light(
      primary: WsyAppColors.primary,
      secondary: WsyAppColors.secondary,
      surface: WsyAppColors.surface,
      error: WsyAppColors.error,
      onPrimary: Colors.white, // 主色上面的文字/图标颜色（白字配蓝底）
      onSurface: WsyAppColors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: wsyColorScheme,
      scaffoldBackgroundColor: WsyAppColors.background,
      textTheme: WsyAppTextStyles.lightTextTheme,
      inputDecorationTheme: _inputDecorationTheme(),
      dividerTheme: const DividerThemeData(
        color: WsyAppColors.border,
        thickness: 1,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData get dark {
    const wsyColorScheme = ColorScheme.dark(
      primary: WsyAppColors.primary,
      secondary: WsyAppColors.secondary,
      surface: WsyAppColors.darkSurface,
      error: WsyAppColors.error,
      onPrimary: Colors.white,
      onSurface: WsyAppColors.darkTextPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: wsyColorScheme,
      scaffoldBackgroundColor: WsyAppColors.darkBackground,
      textTheme: WsyAppTextStyles.darkTextTheme,
      inputDecorationTheme: _inputDecorationTheme(),
      // filledButtonTheme: _filledButtonTheme,
      dividerTheme: const DividerThemeData(
        color: WsyAppColors.darkSurface,
        thickness: 1,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(WsyAppRadius.input),
      ),
    );
  }
}
