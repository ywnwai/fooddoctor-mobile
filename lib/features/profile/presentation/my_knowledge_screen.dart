import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/features/cart/presentation/cart_scope.dart';
import 'package:food_doctor/features/knowledge/data/knowledge_catalog.dart';
import 'package:go_router/go_router.dart';

class MyKnowledgeScreen extends StatelessWidget {
  const MyKnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cart = CartScope.of(context);
    final owned = [
      for (final id in cart.ownedKnowledgeIds)
        if (KnowledgeCatalog.itemById(id) case final item?) item,
    ];

    return FeaturePage(
      title: l10n.myKnowledgeAssets,
      subtitle: l10n.moduleMyRecordsSub,
      showBackButton: true,
      child: owned.isEmpty
          ? EmptyState(
              title: l10n.knowledge,
              message: l10n.moduleMyRecordsSub,
              icon: Icons.menu_book_outlined,
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.xs,
                AppSpacing.page,
                AppSpacing.lg,
              ),
              children: [
                for (final item in owned) ...[
                  DirectoryTile(
                    title: item.title,
                    subtitle: item.isFree ? l10n.free : l10n.purchased,
                    cover: coverForId(item.categoryId),
                    onTap: () =>
                        context.push(AppRoutes.knowledgeItem(item.id)),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ],
            ),
    );
  }
}
