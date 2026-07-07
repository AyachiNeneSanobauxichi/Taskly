import "package:flutter/material.dart";
import "package:todo_app_v1/features/auth/index.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                "创建账号",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "开始管理你的任务",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 32),

              AuthInput(
                label: "用户名",
                icon: Icons.person_outline,
                controller: nameController,
                autofillHints: [AutofillHints.newPassword],
              ),

              const SizedBox(height: 16),

              AuthInput(
                label: "邮箱",
                icon: Icons.mail_outline,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
              ),

              const SizedBox(height: 16),

              AuthPassword(
                label: "密码",
                controller: passwordController,
                autofillHints: [AutofillHints.newPassword],
              ),

              const SizedBox(height: 16),

              AuthPassword(
                label: "确认密码",
                controller: confirmPasswordController,
                autofillHints: [AutofillHints.newPassword],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(value: false, onChanged: null),
                  Expanded(
                    child: Text.rich(
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
                ],
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 52,
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "注册",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                spacing: 12,
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
                  _SocialIconButton(icon: Icons.g_mobiledata, onTap: () {}),
                  _SocialIconButton(icon: Icons.apple, onTap: () {}),
                  _SocialIconButton(icon: Icons.wallet, onTap: () {}),
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

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(52),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 26),
      ),
    );
  }
}
