import "package:flutter/material.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/theme/index.dart";
import "package:todo_app_v1/widgets/index.dart";

export "widgets/index.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: WsyAppSpacing.md),
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
                "创建账号",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: WsyAppSpacing.xs),
              Text(
                "开始管理你的任务",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: WsyAppSpacing.lg),
              AuthInput(
                label: "用户名",
                icon: Icons.person_outline,
                controller: _nameController,
                autofillHints: [AutofillHints.newPassword],
              ),
              const SizedBox(height: WsyAppSpacing.md),
              AuthInput(
                label: "邮箱",
                icon: Icons.mail_outline,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
              ),
              const SizedBox(height: WsyAppSpacing.md),
              AuthPassword(
                label: "密码",
                controller: _passwordController,
                autofillHints: [AutofillHints.newPassword],
              ),
              const SizedBox(height: WsyAppSpacing.md),
              AuthPassword(
                label: "确认密码",
                controller: _confirmPasswordController,
                autofillHints: [AutofillHints.newPassword],
              ),
              const SizedBox(height: WsyAppSpacing.md),
              WsyCheckbox(
                value: _isChecked,
                onChanged: (value) => setState(() => _isChecked = value),
                label: Text.rich(
                  TextSpan(
                    style: theme.textTheme.bodySmall,
                    children: [
                      const TextSpan(text: "我已阅读并同意"),
                      TextSpan(
                        text: "《用户协议》",
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                      const TextSpan(text: "和"),
                      TextSpan(
                        text: "《隐私政策》",
                        style: TextStyle(color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: WsyAppSpacing.md),
              WsyButton(label: "注册", onPressed: () {}, isFullWidth: true),
              const SizedBox(height: WsyAppSpacing.md),
              Row(
                spacing: WsyAppSpacing.sm,
                children: [
                  const Expanded(child: Divider()),
                  Text("或", style: theme.textTheme.bodySmall),
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
                      const TextSpan(text: "已有账号？"),
                      TextSpan(
                        text: "去登录",
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
    );
  }
}
