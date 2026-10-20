import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/gold_icon_tile.dart';
import 'package:food_doctor/core/widgets/info_chip.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final l10n = context.l10n;
    final items = [
      (
        l10n.accountApproved,
        l10n.accountApprovedBody,
        Icons.verified_outlined,
        'SMS',
      ),
      (
        l10n.passwordResetLink,
        l10n.passwordResetLinkBody,
        Icons.lock_reset_outlined,
        'Reset',
      ),
      (
        l10n.paymentConfirmation,
        l10n.paymentConfirmationBody,
        Icons.payments_outlined,
        'Payment',
      ),
    ];

    return FeaturePage(
      title: l10n.notificationsTitle,
      subtitle: l10n.notificationsSubtitle,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          for (final item in items) ...[
            ContentCard(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoldIconTile(icon: item.$3, size: 48),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoChip(label: item.$4),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          item.$1,
                          style: text.title.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(item.$2, style: text.body),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
