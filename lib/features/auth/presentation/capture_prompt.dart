import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/features/auth/domain/registration.dart';

/// Stand-in for the capture check. The code is shown; it is not a live image.
class CapturePrompt extends StatelessWidget {
  const CapturePrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.goldSoft,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Capture', style: text.caption),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            expectedCapture,
            style: text.heading.copyWith(
              color: AppColors.goldInk,
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }
}
