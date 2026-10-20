import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
      color: AppColors.navy,
      fontWeight: FontWeight.w600,
    );
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.navy,
          side: const BorderSide(color: AppColors.navy),
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
