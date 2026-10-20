import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/utils/kyat.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/guide_video_card.dart';
import 'package:food_doctor/core/widgets/status_badge.dart';
import 'package:food_doctor/features/knowledge/data/knowledge_catalog.dart';
import 'package:go_router/go_router.dart';

class KnowledgeListScreen extends StatelessWidget {
  const KnowledgeListScreen({
    super.key,
    required this.categoryId,
    required this.sizeId,
    required this.typeId,
  });

  final String categoryId;
  final String sizeId;
  final String typeId;

  @override
  Widget build(BuildContext context) {
    final type = KnowledgeCatalog.typeById(typeId);
    final items = KnowledgeCatalog.itemsFor(
      categoryId: categoryId,
      sizeId: sizeId,
      typeId: typeId,
    );
    if (type == null || items.isEmpty) {
      return const FeaturePage(
        title: 'Knowledge',
        showBackButton: true,
        child: EmptyState(
          title: 'No knowledge yet',
          message: 'This combination has no items in the sample catalog.',
        ),
      );
    }

    return FeaturePage(
      title: type.name,
      subtitle: 'Knowledge list',
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          const GuideVideoCard(),
          const SizedBox(height: AppSpacing.md),
          for (final item in items) ...[
            DirectoryTile(
              title: item.title,
              subtitle: item.isFree ? 'Free' : formatKyat(item.priceKyat),
              cover: coverForId(item.categoryId),
              trailing: StatusBadge(
                label: item.isFree ? 'Free' : 'Paid',
                compact: true,
              ),
              onTap: () => context.push(AppRoutes.knowledgeItem(item.id)),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
