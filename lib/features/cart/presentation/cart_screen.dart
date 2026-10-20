import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/utils/kyat.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/core/widgets/secondary_button.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartScope.of(context);
    final text = context.appText;
    return FeaturePage(
      title: 'Check out',
      subtitle: 'Knowledge purchase',
      showBackButton: true,
      child: cart.purchases.isEmpty
          ? const EmptyState(
              title: 'Cart is empty',
              message: 'Shop from the knowledge catalog to add a paid item.',
              icon: Icons.shopping_bag_outlined,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.xs,
                AppSpacing.page,
                AppSpacing.lg,
              ),
              children: [
                for (final line in cart.purchases) ...[
                  ContentCard(
                    child: Row(
                      children: [
                        CoverArt(
                          kind: coverForId(line.id),
                          width: 64,
                          height: 64,
                          radius: 12,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            line.title,
                            style: text.title.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          formatKyat(line.priceKyat),
                          style: text.body.copyWith(color: AppColors.textPrimary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Total  ${formatKyat(cart.purchaseTotal)}',
                  style: text.title.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: AppSpacing.lg),
                SecondaryButton(
                  label: 'Clear cart',
                  onPressed: cart.clearPurchases,
                ),
                const SizedBox(height: AppSpacing.xs),
                PrimaryButton(
                  label: 'Confirm purchase',
                  onPressed: () => _confirm(context),
                ),
              ],
            ),
    );
  }

  void _confirm(BuildContext context) {
    showAppDialog(
      context: context,
      title: 'Pay with MMQR',
      message:
          'After you pay, send the screenshot to Viber 0900000. The receipt is confirmed within 24 hours and you will be contacted by SMS. Thank you.',
      extra: const _MmqrMark(),
      primaryLabel: 'Done',
      onPrimary: () => CartScope.of(context).confirmPurchase(),
    );
  }
}

class _MmqrMark extends StatelessWidget {
  const _MmqrMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.goldSoft,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.45)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.qr_code_2_rounded,
            size: 48,
            color: AppColors.goldInk.withValues(alpha: 0.7),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'MMQR',
            style: context.appText.title.copyWith(
              color: AppColors.goldInk,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
