import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:go_router/go_router.dart";
import "package:todo_app_v1/app/router/index.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";
import "package:todo_app_v1/shared/widgets/index.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // "去注册" 富文本链接的点击识别器（需随 State 释放）。
  late final TapGestureRecognizer _goRegisterTap;

  @override
  void initState() {
    super.initState();
    _goRegisterTap = TapGestureRecognizer()
      ..onTap = () => context.goNamed(RouteName.register);
  }

  void _onLogin() {
    final formValid = _formKey.currentState!.validate();
    if (!formValid) return; // 输入框有错，停止
    // v1 仅静态 UI，暂无登录逻辑；校验通过直接进首页。
    // TODO(auth): 接入登录接口，成功后再跳转 home。
    context.goNamed(RouteName.home);
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _goRegisterTap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: WsyAppSpacing.md),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: WsyAppSpacing.lg),
                Center(
                  child: Container(
                    width: WsyAppSpacing.xxl * 1.5,
                    height: WsyAppSpacing.xxl * 1.5,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_outline,
                      size: WsyAppSpacing.xxl,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                Text(
                  l10n.loginTitle,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.xs),
                Text(
                  l10n.loginSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.lg),
                AuthInput(
                  label: l10n.authEmailLabel,
                  icon: Icons.mail_outline,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: [AutofillHints.email],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                AuthPassword(
                  label: l10n.authPasswordLabel,
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  autofillHints: [AutofillHints.password],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                    FormBuilderValidators.maxLength(16),
                  ]),
                ),
                const SizedBox(height: WsyAppSpacing.xs),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(l10n.loginForgotPassword),
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.sm),
                WsyButton(
                  label: l10n.loginSubmit,
                  onPressed: _onLogin,
                  isFullWidth: true,
                ),
                const SizedBox(height: WsyAppSpacing.md),
                Row(
                  spacing: WsyAppSpacing.sm,
                  children: [
                    const Expanded(child: Divider()),
                    Text(l10n.commonOr, style: theme.textTheme.bodySmall),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: WsyAppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: WsyAppSpacing.md,
                  children: [
                    SocialIconButton(icon: Icons.g_mobiledata, onTap: () {}),
                    SocialIconButton(icon: Icons.apple, onTap: () {}),
                    SocialIconButton(icon: Icons.wallet, onTap: () {}),
                  ],
                ),
                const SizedBox(height: WsyAppSpacing.xl),
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(text: l10n.loginNoAccount),
                        TextSpan(
                          text: l10n.loginGoRegister,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: _goRegisterTap,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
