// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Taskly';

  @override
  String get commonOr => '或';

  @override
  String get authEmailLabel => '邮箱';

  @override
  String get authPasswordLabel => '密码';

  @override
  String get authShowPassword => '显示密码';

  @override
  String get authHidePassword => '隐藏密码';

  @override
  String get loginTitle => '欢迎回来';

  @override
  String get loginSubtitle => '登录以继续管理你的任务';

  @override
  String get loginForgotPassword => '忘记密码？';

  @override
  String get loginSubmit => '登录';

  @override
  String get loginNoAccount => '还没有账号？';

  @override
  String get loginGoRegister => '去注册';

  @override
  String get registerTitle => '创建账号';

  @override
  String get registerSubtitle => '开始管理你的任务';

  @override
  String get registerUsernameLabel => '用户名';

  @override
  String get registerConfirmPasswordLabel => '确认密码';

  @override
  String get registerPasswordMismatch => '两次密码不一致';

  @override
  String get registerAgreementPrefix => '我已阅读并同意';

  @override
  String get registerUserAgreement => '《用户协议》';

  @override
  String get registerAgreementAnd => '和';

  @override
  String get registerPrivacyPolicy => '《隐私政策》';

  @override
  String get registerAgreementRequired => '请先阅读并同意用户协议';

  @override
  String get registerSubmit => '注册';

  @override
  String get registerHaveAccount => '已有账号？';

  @override
  String get registerGoLogin => '去登录';
}
