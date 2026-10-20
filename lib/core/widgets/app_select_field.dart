import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class AppSelectField<T> extends StatelessWidget {
  const AppSelectField({
    super.key,
    required this.label,
    required this.options,
    required this.labelOf,
    required this.onChanged,
    this.value,
  });

  final String label;
  final T? value;
  final List<T> options;
  final String Function(T option) labelOf;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: const BorderSide(color: AppColors.border),
    );
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: AppColors.card,
        labelStyle: text.caption,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: border,
        enabledBorder: border,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          value: value,
          hint: Text(context.l10n.select, style: text.body),
          style: text.body.copyWith(color: AppColors.textPrimary),
          dropdownColor: AppColors.card,
          items: [
            for (final option in options)
              DropdownMenuItem(value: option, child: Text(labelOf(option))),
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
