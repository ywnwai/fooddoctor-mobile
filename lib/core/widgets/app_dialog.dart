import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/core/widgets/secondary_button.dart';

Future<void> showAppDialog({
  required BuildContext context,
  required String title,
  required String message,
  String? primaryLabel,
  VoidCallback? onPrimary,
  String? secondaryLabel,
  VoidCallback? onSecondary,
  Widget? extra,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final text = dialogContext.appText;
      return AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        title: Text(
          title,
          style: text.title.copyWith(fontWeight: FontWeight.w700),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(message, style: text.body),
            if (extra != null) ...[
              const SizedBox(height: AppSpacing.md),
              extra,
            ],
            if (primaryLabel != null) ...[
              const SizedBox(height: AppSpacing.md),
              PrimaryButton(
                label: primaryLabel,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onPrimary?.call();
                },
              ),
            ],
            if (secondaryLabel != null) ...[
              const SizedBox(height: AppSpacing.xs),
              SecondaryButton(
                label: secondaryLabel,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onSecondary?.call();
                },
              ),
            ],
          ],
        ),
      );
    },
  );
}
