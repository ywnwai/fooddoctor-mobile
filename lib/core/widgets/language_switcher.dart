import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/app_language.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.localeController;
    final l10n = context.l10n;
    final text = context.appText;

    return ContentCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.language,
            style: text.title.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(l10n.languageSubtitle, style: text.caption),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              for (final language in AppLanguage.values) ...[
                Expanded(
                  child: _LanguageChip(
                    label: language.nativeLabel,
                    selected: controller.language == language,
                    onTap: () => controller.setLanguage(language),
                  ),
                ),
                if (language != AppLanguage.values.last)
                  const SizedBox(width: AppSpacing.xs),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _LanguageChip extends StatelessWidget {
  const _LanguageChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.goldSoft : AppColors.background,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: Border.all(
              color: selected
                  ? AppColors.gold
                  : AppColors.border,
            ),
          ),
          child: Text(
            label,
            style: context.appText.body.copyWith(
              color: selected ? AppColors.goldInk : AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
