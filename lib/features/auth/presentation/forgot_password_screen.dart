import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/app_text_field.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmed = TextEditingController();
  var _requested = false;
  var _error = '';

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    _confirmed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return FeaturePage(
      title: 'Forgot password',
      subtitle: 'Reset through the administrator',
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          Text(
            'Enter the telephone on the account. At first launch the administrator sends the reset link by SMS or email by hand.',
            style: text.body,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextField(
            label: 'Registered telephone',
            controller: _phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(
            label: 'Request reset link',
            onPressed: () {
              if (_phone.text.trim().isEmpty) {
                setState(() => _error = 'Enter the registered telephone.');
                return;
              }
              setState(() {
                _error = '';
                _requested = true;
              });
            },
          ),
          if (_requested) ...[
            const SizedBox(height: AppSpacing.lg),
            Text(
              'The reset link asks for a new password and a confirmed password.',
              style: text.body,
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(
              label: 'Password',
              controller: _password,
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppTextField(
              label: 'Confirmed password',
              controller: _confirmed,
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.md),
            PrimaryButton(label: 'Save new password', onPressed: _save),
          ],
          if (_error.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(_error, style: text.caption.copyWith(color: AppColors.danger)),
          ],
        ],
      ),
    );
  }

  void _save() {
    if (_password.text.isEmpty) {
      setState(() => _error = 'Enter a new password.');
      return;
    }
    if (_password.text != _confirmed.text) {
      setState(() => _error = 'The passwords do not match.');
      return;
    }
    setState(() => _error = '');
    showAppDialog(
      context: context,
      title: 'Password saved',
      message: 'Sign in with the new password after this device stores it.',
      primaryLabel: 'Sign in',
      onPrimary: () => context.go(AppRoutes.login),
    );
  }
}
