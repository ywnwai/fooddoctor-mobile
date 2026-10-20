import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.label, this.compact = false});

  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: compact ? null : 76,
      padding: EdgeInsets.symmetric(
        horizontal: compact ? AppSpacing.xs : AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.goldSoft,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.45)),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: context.appText.caption.copyWith(
          color: AppColors.goldInk,
          fontWeight: FontWeight.w700,
          height: 1.25,
        ),
      ),
    );
  }
}
