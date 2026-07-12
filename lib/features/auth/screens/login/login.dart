import "package:flutter/material.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/theme/index.dart";
import "package:todo_app_v1/widgets/index.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLogin() {
    final formValid = _formKey.currentState!.validate();
    if (!formValid) return; // 输入框有错，停止
    // 全部通过 → 调用登录逻辑（v1 仅静态 UI，逻辑后续接入）
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  "欢迎回来",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.xs),
                Text(
                  "登录以继续管理你的任务",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.lg),
                AuthInput(
                  label: "邮箱",
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
                  label: "密码",
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
                    child: const Text("忘记密码？"),
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.sm),
                WsyButton(label: "登录", onPressed: _onLogin, isFullWidth: true),
                const SizedBox(height: WsyAppSpacing.md),
                Row(
                  spacing: WsyAppSpacing.sm,
                  children: [
                    const Expanded(child: Divider()),
                    Text("或", style: theme.textTheme.bodySmall),
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
                        const TextSpan(text: "还没有账号？"),
                        TextSpan(
                          text: "去注册",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
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
