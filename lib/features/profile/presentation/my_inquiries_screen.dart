import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';

class MyInquiriesScreen extends StatelessWidget {
  const MyInquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final text = context.appText;
    final inquiries = CartScope.of(context).sentInquiries;

    return FeaturePage(
      title: l10n.myInquiry,
      subtitle: l10n.inquiry,
      showBackButton: true,
      child: inquiries.isEmpty
          ? EmptyState(
              title: l10n.inquiry,
              message: l10n.moduleMyRecordsSub,
              icon: Icons.forum_outlined,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.xs,
                AppSpacing.page,
                AppSpacing.lg,
              ),
              children: [
                for (final inquiry in inquiries) ...[
                  ContentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          inquiry.title,
                          style: text.title.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(inquiry.answer, style: text.body),
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
