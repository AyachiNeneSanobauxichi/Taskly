import "package:flutter/material.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";
import "package:todo_app_v1/shared/widgets/index.dart";

export "widgets/index.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;

  void _onRegister() {
    final formValid = _formKey.currentState!.validate();
    if (!formValid) return; // 输入框有错，停止
    if (!_isChecked) {
      // 协议单独校验（见下）
      // 提示未勾选协议
      return;
    }
    // 全部通过 → 调用注册逻辑（v1 仅静态 UI，逻辑后续接入）
    // TODO(auth): 接入注册接口，成功后跳转；当前仅占位
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      Icons.person,
                      size: WsyAppSpacing.xxl,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                Text(
                  l10n.registerTitle,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.xs),
                Text(
                  l10n.registerSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: WsyAppSpacing.lg),
                AuthInput(
                  label: l10n.registerUsernameLabel,
                  icon: Icons.person_outline,
                  controller: _nameController,
                  autofillHints: [AutofillHints.newUsername],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(3),
                    FormBuilderValidators.maxLength(16),
                  ]),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                AuthInput(
                  label: l10n.authEmailLabel,
                  icon: Icons.mail_outline,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
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
                  autofillHints: [AutofillHints.newPassword],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                    FormBuilderValidators.maxLength(16),
                  ]),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                AuthPassword(
                  label: l10n.registerConfirmPasswordLabel,
                  controller: _confirmPasswordController,
                  autofillHints: [AutofillHints.newPassword],
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    (value) => value == _passwordController.text
                        ? null
                        : l10n.registerPasswordMismatch,
                  ]),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                WsyCheckboxFormField(
                  value: _isChecked,
                  label: Text.rich(
                    TextSpan(
                      style: theme.textTheme.bodySmall,
                      children: [
                        TextSpan(text: l10n.registerAgreementPrefix),
                        TextSpan(
                          text: l10n.registerUserAgreement,
                          style: TextStyle(color: theme.colorScheme.primary),
                        ),
                        TextSpan(text: l10n.registerAgreementAnd),
                        TextSpan(
                          text: l10n.registerPrivacyPolicy,
                          style: TextStyle(color: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                  validator: (v) =>
                      (v ?? false) ? null : l10n.registerAgreementRequired,
                  onChanged: (value) => setState(() => _isChecked = value),
                ),
                const SizedBox(height: WsyAppSpacing.md),
                WsyButton(
                  label: l10n.registerSubmit,
                  onPressed: _onRegister,
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
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    SocialIconButton(icon: Icons.g_mobiledata, onTap: () {}),
                    SocialIconButton(icon: Icons.apple, onTap: () {}),
                    SocialIconButton(icon: Icons.wallet, onTap: () {}),
                  ],
                ),

                const SizedBox(height: 32),

                Center(
                  child: Text.rich(
                    TextSpan(
                      style: theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(text: l10n.registerHaveAccount),
                        TextSpan(
                          text: l10n.registerGoLogin,
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
