import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/gold_icon_tile.dart';

/// Home-grid card. It fills the height of its parent so a row of cards
/// stays even when subtitles wrap.
class ModuleCard extends StatelessWidget {
  const ModuleCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.mark,
    this.onTap,
  }) : assert(
         icon != null || mark != null,
         'Provide an icon or a letter mark.',
       );

  final String title;
  final String subtitle;
  final IconData? icon;
  final String? mark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ContentCard(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoldIconTile(icon: icon, mark: mark),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: text.title.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: text.body.copyWith(fontSize: 13, height: 1.35),
            ),
          ],
        ),
      ),
    );
  }
}
