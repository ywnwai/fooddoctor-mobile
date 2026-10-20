import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';

/// Place for the navigation video the catalog steps call for.
class GuideVideoCard extends StatelessWidget {
  const GuideVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    final l10n = context.l10n;
    return ContentCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CoverArt(
            kind: CoverKind.video,
            height: 132,
            radius: 0,
            showPlay: true,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.navigationVideo,
                  style: text.title.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  l10n.navigationVideoBody,
                  style: text.caption.copyWith(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
