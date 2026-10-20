import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

/// Search field for catalog and directory screens.
///
/// Named [AppSearchBar] so it does not clash with Material's [SearchBar].
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.border),
    );
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      style: text.body.copyWith(color: AppColors.textPrimary),
      cursorColor: AppColors.navy,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.card,
        hintStyle: text.body.copyWith(color: AppColors.textMuted),
        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.gold, width: 1.4),
        ),
      ),
    );
  }
}
