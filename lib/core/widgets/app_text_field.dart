import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.onChanged,
    this.maxLines = 1,
  });

  final String label;
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.border),
    );
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines,
      textInputAction: textInputAction,
      onChanged: onChanged,
      style: text.body.copyWith(color: AppColors.textPrimary),
      cursorColor: AppColors.navy,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: AppColors.card,
        labelStyle: text.caption,
        hintStyle: text.body.copyWith(color: AppColors.textMuted),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
        ),
      ),
    );
  }
}
