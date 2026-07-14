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
  String get authIdentifierLabel => '邮箱或用户名';

  @override
  String get authPasswordWeak => '密码需包含至少一个大写字母、一个小写字母、一个数字和一个特殊字符';

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

  @override
  String get authErrorGeneric => '出错了，请稍后再试';

  @override
  String get registerSuccess => '注册成功，请登录';

  @override
  String get homeTitle => '首页（占位）';

  @override
  String get homeBackToLogin => '返回登录';

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '保存';

  @override
  String get commonRetry => '重试';

  @override
  String get todoListTitle => '我的任务';

  @override
  String get todoSearchHint => '搜索任务';

  @override
  String get todoLogout => '登出';

  @override
  String get todoEmpty => '暂无任务';

  @override
  String get todoLoadError => '加载失败，下拉刷新重试';

  @override
  String get todoActionEdit => '编辑';

  @override
  String get todoActionDelete => '删除';

  @override
  String get todoFilterTypeAll => '全部类型';

  @override
  String get todoFilterStatusAll => '全部状态';

  @override
  String get todoTypeNormal => '普通';

  @override
  String get todoTypeImportant => '重要';

  @override
  String get todoTypeUrgent => '紧急';

  @override
  String get todoStatusPending => '待办';

  @override
  String get todoStatusDoing => '进行中';

  @override
  String get todoStatusCompleted => '已完成';

  @override
  String get todoDeleteTitle => '删除任务？';

  @override
  String todoDeleteMessage(String name) {
    return '将删除「$name」。';
  }

  @override
  String get todoDeleteSuccess => '已删除';

  @override
  String get todoEditTitle => '编辑任务';

  @override
  String get todoFieldName => '名称';

  @override
  String get todoFieldContent => '内容';

  @override
  String get todoFieldType => '类型';

  @override
  String get todoFieldStatus => '状态';

  @override
  String get todoSaveSuccess => '已保存';

  @override
  String get todoDetailTitle => '任务详情';

  @override
  String get todoDetailCreatedAt => '创建时间';

  @override
  String get todoDetailUpdatedAt => '更新时间';

  @override
  String get routeNotFound => '页面不存在';
}
