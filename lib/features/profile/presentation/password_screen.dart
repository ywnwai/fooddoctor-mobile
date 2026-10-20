import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_text_field.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  var _message = '';
  var _saved = false;

  @override
  void dispose() {
    _oldPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FeaturePage(
      title: l10n.resetPassword,
      subtitle: l10n.password,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          AppTextField(
            label: l10n.oldPassword,
            controller: _oldPassword,
            obscureText: true,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            label: l10n.newPassword,
            controller: _newPassword,
            obscureText: true,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppTextField(
            label: l10n.confirmedPassword,
            controller: _confirmPassword,
            obscureText: true,
          ),
          if (_message.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              _message,
              style: context.appText.caption.copyWith(
                color: _saved ? AppColors.green : AppColors.danger,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(label: l10n.updatePassword, onPressed: _save),
        ],
      ),
    );
  }

  void _save() {
    if (_oldPassword.text.isEmpty ||
        _newPassword.text.isEmpty ||
        _confirmPassword.text.isEmpty) {
      setState(() {
        _saved = false;
        _message = 'Enter the old password and the new one.';
      });
      return;
    }
    if (_newPassword.text != _confirmPassword.text) {
      setState(() {
        _saved = false;
        _message = 'The new passwords do not match.';
      });
      return;
    }
    _oldPassword.clear();
    _newPassword.clear();
    _confirmPassword.clear();
    setState(() {
      _saved = true;
      _message = 'Password updated on this device.';
    });
  }
}
