import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/utils/kyat.dart';
import 'package:food_doctor/core/widgets/app_dialog.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/info_chip.dart';
import 'package:food_doctor/core/widgets/media_placeholder.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/core/widgets/status_badge.dart';
import 'package:food_doctor/features/cart/domain/selection_cart.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';
import 'package:food_doctor/features/knowledge/data/knowledge_catalog.dart';
import 'package:food_doctor/features/knowledge/domain/knowledge_models.dart';
import 'package:go_router/go_router.dart';

class KnowledgeDetailScreen extends StatelessWidget {
  const KnowledgeDetailScreen({super.key, required this.itemId});

  final String itemId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final item = KnowledgeCatalog.itemById(itemId);
    if (item == null) {
      return FeaturePage(
        title: l10n.knowledge,
        showBackButton: true,
        child: EmptyState(
          title: l10n.notFound,
          message: l10n.knowledgeCatalog,
        ),
      );
    }

    return FeaturePage(
      title: item.title,
      subtitle: item.isFree ? l10n.free : formatKyat(item.priceKyat),
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          MediaPlaceholder(
            kind: coverForId(item.categoryId),
            label: 'Photo',
          ),
          const SizedBox(height: AppSpacing.md),
          ContentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    StatusBadge(
                      label: item.isFree ? l10n.free : l10n.paid,
                      compact: true,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    InfoChip(
                      label: item.isFree
                          ? l10n.included
                          : formatKyat(item.priceKyat),
                      tone: InfoChipTone.navy,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Text(item.description, style: context.appText.body),
              ],
            ),
          ),
          if (!item.isFree) ...[
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: l10n.purchase,
              onPressed: () => _purchase(context, item),
            ),
          ],
        ],
      ),
    );
  }

  void _purchase(BuildContext context, KnowledgeItem item) {
    final l10n = context.l10n;
    final line = CartLine(
      id: item.id,
      title: item.title,
      priceKyat: item.priceKyat,
    );
    showAppDialog(
      context: context,
      title: l10n.purchase,
      message: l10n.purchaseMessage,
      primaryLabel: l10n.checkOut,
      onPrimary: () {
        CartScope.of(context).addPurchase(line);
        context.push(AppRoutes.cart);
      },
      secondaryLabel: l10n.shopMore,
      onSecondary: () {
        CartScope.of(context).addPurchase(line);
        context.go(AppRoutes.catalog);
      },
    );
  }
}
