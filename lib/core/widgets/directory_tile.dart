import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/info_chip.dart';

class DirectoryTile extends StatelessWidget {
  const DirectoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.leading,
    this.trailing,
    this.cover,
    this.chip,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final CoverKind? cover;
  final String? chip;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return ContentCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        children: [
          if (cover != null)
            CoverArt(
              kind: cover!,
              width: 72,
              height: 72,
              radius: AppRadius.lg,
            )
          else if (leading != null)
            leading!,
          if (cover != null || leading != null)
            const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (chip != null) ...[
                  InfoChip(label: chip!),
                  const SizedBox(height: AppSpacing.xxs),
                ],
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: text.title.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: text.body.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.xxs),
          trailing ??
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
