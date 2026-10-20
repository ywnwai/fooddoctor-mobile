import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';

class ErrorState extends StatelessWidget {
  const ErrorState({super.key, required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: AppColors.danger, size: 36),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.appText.body.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.md),
              SizedBox(
                width: 180,
                child: PrimaryButton(label: 'Try again', onPressed: onRetry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
