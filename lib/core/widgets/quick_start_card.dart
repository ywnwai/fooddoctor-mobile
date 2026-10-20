import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_shadows.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/gold_icon_tile.dart';

class QuickStartCard extends StatelessWidget {
  const QuickStartCard({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.body,
    this.onTap,
  });

  final String eyebrow;
  final String title;
  final String body;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final radius = BorderRadius.circular(AppRadius.xl);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: AppColors.card,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: radius,
              border: Border.all(color: AppColors.gold.withValues(alpha: 0.4)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.card,
                  AppColors.goldSoft.withValues(alpha: 0.55),
                ],
              ),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GoldIconTile(
                  icon: Icons.route_rounded,
                  size: 44,
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eyebrow, style: text.label),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        title,
                        style: text.title.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(body, style: text.body),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: AppColors.goldInk,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
