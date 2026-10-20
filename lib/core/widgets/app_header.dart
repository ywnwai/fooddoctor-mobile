import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_shadows.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/food_doctor_mark.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.onAction,
    this.actionIcon = Icons.refresh_rounded,
    this.actionTooltip = 'Back to top',
  });

  final String eyebrow;
  final String title;
  final VoidCallback? onAction;
  final IconData actionIcon;
  final String actionTooltip;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Row(
      children: [
        const FoodDoctorMark(),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eyebrow, style: text.label),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                title,
                style: text.heading.copyWith(fontSize: 28, height: 1.1),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.xs),
        _HeaderAction(
          onPressed: onAction,
          icon: actionIcon,
          tooltip: actionTooltip,
        ),
      ],
    );
  }
}

class _HeaderAction extends StatelessWidget {
  const _HeaderAction({
    required this.onPressed,
    required this.icon,
    required this.tooltip,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.md);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: AppColors.card,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: IconButton(
          tooltip: tooltip,
          onPressed: onPressed,
          icon: Icon(icon, color: AppColors.gold),
        ),
      ),
    );
  }
}
