import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_shadows.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.color = AppColors.card,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.xl);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: AppShadows.card,
      ),
      child: Material(
        color: color,
        borderRadius: radius,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
