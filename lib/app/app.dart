import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:todo_app_v1/theme/index.dart";
import "package:todo_app_v1/features/auth/index.dart";

class WsyApp extends StatelessWidget {
  const WsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Taskly",
      theme: WsyAppTheme.light, // 亮色主题
      darkTheme: WsyAppTheme.dark, // 深色主题
      themeMode: ThemeMode.system, // 跟随系统切换深浅色
      locale: const Locale("zh", "CN"),
      supportedLocales: const [Locale("zh", "CN"), Locale("en", "US")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate, // 关键：库的中文错误文案
      ],
      debugShowCheckedModeBanner: true,
      home: const LoginScreen(),
    );
  }
}
