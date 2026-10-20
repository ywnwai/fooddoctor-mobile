import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phone = TextEditingController();
  final _password = TextEditingController();
  var _error = '';

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.contentMaxWidth,
            ),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.xl,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              children: [
                const _LoginBrand(),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  l10n.welcomeBack,
                  textAlign: TextAlign.center,
                  style: text.heading.copyWith(
                    fontSize: 30,
                    height: 1.15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.loginSubtitle,
                  textAlign: TextAlign.center,
                  style: text.body.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                _AuthField(
                  label: l10n.telephone,
                  controller: _phone,
                  hint: '09 250 000 000',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                _AuthField(
                  label: l10n.password,
                  controller: _password,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                ),
                if (_error.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    _error,
                    textAlign: TextAlign.center,
                    style: text.caption.copyWith(color: AppColors.danger),
                  ),
                ],
                const SizedBox(height: AppSpacing.lg),
                _GoldSignInButton(label: l10n.signIn, onPressed: _submit),
                const SizedBox(height: AppSpacing.sm),
                _OutlineAuthButton(
                  label: l10n.forgotPassword,
                  onPressed: () => context.push(AppRoutes.forgotPassword),
                ),
                const SizedBox(height: AppSpacing.xxl),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.noAccount,
                      style: text.body.copyWith(color: AppColors.textPrimary),
                    ),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.register),
                      child: Text(
                        l10n.register,
                        style: text.body.copyWith(
                          color: AppColors.gold,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_phone.text.trim().isEmpty || _password.text.isEmpty) {
      setState(() => _error = 'Enter your telephone and password.');
      return;
    }
    context.go(AppRoutes.home);
  }
}

class _LoginBrand extends StatelessWidget {
  const _LoginBrand();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/food_doctor_logo.png',
        width: 168,
        height: 96,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class _AuthField extends StatelessWidget {
  const _AuthField({
    required this.label,
    required this.controller,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.onSubmitted,
  });

  final String label;
  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.border),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: text.caption.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          style: text.body.copyWith(color: AppColors.textPrimary),
          cursorColor: AppColors.goldInk,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: text.body.copyWith(color: AppColors.textMuted),
            filled: true,
            fillColor: AppColors.card,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}

class _GoldSignInButton extends StatelessWidget {
  const _GoldSignInButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Ink(
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.md),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE8C547), Color(0xFFC8960C)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withValues(alpha: 0.35),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: text.body.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineAuthButton extends StatelessWidget {
  const _OutlineAuthButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        child: Text(
          label,
          style: text.body.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
