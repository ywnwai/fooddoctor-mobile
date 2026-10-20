import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/core/widgets/secondary_button.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartScope.of(context);
    final text = context.appText;
    return FeaturePage(
      title: 'Check out',
      subtitle: 'Material inquiry',
      showBackButton: true,
      child: cart.inquiries.isEmpty
          ? const EmptyState(
              title: 'No inquiry yet',
              message:
                  'Choose a raw material, packaging item, or machine and write a question.',
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
                for (final line in cart.inquiries) ...[
                  ContentCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          line.title,
                          style: text.title.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xxs),
                        Text(line.note, style: text.body),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
                const SizedBox(height: AppSpacing.sm),
                SecondaryButton(
                  label: 'Clear cart',
                  onPressed: cart.clearInquiries,
                ),
                const SizedBox(height: AppSpacing.xs),
                PrimaryButton(
                  label: 'Confirm inquiry',
                  onPressed: () => _confirm(context),
                ),
              ],
            ),
    );
  }

  void _confirm(BuildContext context) {
    showAppDialog(
      context: context,
      title: 'Inquiry sent',
      message:
          'The raw materials, packaging, and machinery and spare parts have been sent to the administrator.',
      primaryLabel: 'Done',
      onPrimary: () => CartScope.of(context).confirmInquiries(),
    );
  }
}
