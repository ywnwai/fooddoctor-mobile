import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({super.key, required this.label, this.tone = InfoChipTone.gold});

  final String label;
  final InfoChipTone tone;

  @override
  Widget build(BuildContext context) {
    final colors = switch (tone) {
      InfoChipTone.gold => (AppColors.goldSoft, AppColors.goldInk),
      InfoChipTone.navy => (
        AppColors.navy.withValues(alpha: 0.08),
        AppColors.navy,
      ),
      InfoChipTone.muted => (AppColors.background, AppColors.textSecondary),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: colors.$1,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: context.appText.caption.copyWith(
          color: colors.$2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

enum InfoChipTone { gold, navy, muted }
