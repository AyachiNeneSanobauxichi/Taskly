import "package:flutter/material.dart";
import "index.dart";

abstract final class WsyAppTheme {
  static InputDecorationTheme get _inputDecorationTheme {
    OutlineInputBorder border(
      Color color, [
      double width = WsyAppSpacing.xxxs,
    ]) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(WsyAppRadius.input),
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return InputDecorationTheme(
      enabledBorder: border(WsyAppColors.border),
      focusedBorder: border(WsyAppColors.primary, WsyAppSpacing.xxs),
      errorBorder: border(WsyAppColors.error),
      focusedErrorBorder: border(WsyAppColors.error, WsyAppSpacing.xxs),
      errorStyle: WsyAppTextStyles.lightTextTheme.bodySmall?.copyWith(
        color: WsyAppColors.error,
      ),
    );
  }

  static FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(WsyAppSpacing.xxxl), // 高度统一，宽度不强制
        textStyle: WsyAppTextStyles.lightTextTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WsyAppRadius.button),
        ),
      ),
    );
  }

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
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
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
      inputDecorationTheme: _inputDecorationTheme,
      filledButtonTheme: _filledButtonTheme,
      dividerTheme: const DividerThemeData(
        color: WsyAppColors.darkSurface,
        thickness: 1,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
