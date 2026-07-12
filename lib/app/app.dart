import "package:flutter/material.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

class WsyApp extends StatelessWidget {
  const WsyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 标题走本地化（随 locale 切换）
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      theme: WsyAppTheme.light, // 亮色主题
      darkTheme: WsyAppTheme.dark, // 深色主题
      themeMode: ThemeMode.system, // 跟随系统切换深浅色
      // 不写死 locale：跟随手机系统语言，命中 supportedLocales 则用之，否则回退首项（en）
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        ...AppLocalizations
            .localizationsDelegates, // 应用文案 + Material/Widgets/Cupertino 全局本地化
        FormBuilderLocalizations.delegate, // 表单校验库的错误文案本地化
      ],
      debugShowCheckedModeBanner: true,
      home: const LoginScreen(),
    );
  }
}
