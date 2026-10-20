import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

/// Small gold mark used on module cards and empty states.
class GoldIconTile extends StatelessWidget {
  const GoldIconTile({super.key, this.icon, this.mark, this.size = 48})
    : assert(icon != null || mark != null, 'Provide an icon or a letter mark.');

  final IconData? icon;
  final String? mark;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.goldSoft, Color(0xFFF0E4B0)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withValues(alpha: 0.18),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: mark != null
          ? Text(
              mark!,
              style: context.appText.caption.copyWith(
                color: AppColors.goldInk,
                fontWeight: FontWeight.w700,
                fontSize: size * 0.32,
                letterSpacing: 0.2,
              ),
            )
          : Icon(icon, color: AppColors.goldInk, size: size * 0.46),
    );
  }
}
