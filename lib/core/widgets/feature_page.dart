import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/navigation.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

/// Shared page frame for feature screens.
///
/// Shell tabs omit the back control. Pushed screens show it.
class FeaturePage extends StatelessWidget {
  const FeaturePage({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.showBackButton = false,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final bool showBackButton;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.contentMaxWidth,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    showBackButton ? AppSpacing.xxs : AppSpacing.page,
                    AppSpacing.sm,
                    AppSpacing.page,
                    AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      if (showBackButton) ...[
                        IconButton(
                          tooltip: context.l10n.back,
                          onPressed: () => popOrGoHome(context),
                          visualDensity: VisualDensity.compact,
                          padding: const EdgeInsets.all(AppSpacing.xs),
                          constraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                          icon: const Icon(
                            Icons.chevron_left_rounded,
                            size: 32,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xxs),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: text.title.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                height: 1.2,
                              ),
                            ),
                            if (subtitle != null) ...[
                              const SizedBox(height: AppSpacing.xxs),
                              Text(subtitle!, style: text.caption),
                            ],
                          ],
                        ),
                      ),
                      ?trailing,
                    ],
                  ),
                ),
                const Divider(height: 1, color: AppColors.border),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
