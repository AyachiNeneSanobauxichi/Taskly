import "package:flutter/material.dart";

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
      debugShowCheckedModeBanner: true,
      home: const RegisterScreen(),
    );
  }
}
