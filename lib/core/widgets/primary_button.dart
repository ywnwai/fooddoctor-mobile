import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final style = context.appText.body.copyWith(
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    );
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.navy,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.navy.withValues(alpha: 0.35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        child: icon == null
            ? Text(label, style: style)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 18),
                  const SizedBox(width: AppSpacing.xs),
                  Text(label, style: style),
                ],
              ),
      ),
    );
  }
}
