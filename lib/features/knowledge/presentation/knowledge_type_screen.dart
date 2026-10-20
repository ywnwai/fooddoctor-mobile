import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/guide_video_card.dart';
import 'package:food_doctor/features/knowledge/data/knowledge_catalog.dart';
import 'package:go_router/go_router.dart';

class KnowledgeTypeScreen extends StatelessWidget {
  const KnowledgeTypeScreen({
    super.key,
    required this.categoryId,
    required this.sizeId,
  });

  final String categoryId;
  final String sizeId;

  @override
  Widget build(BuildContext context) {
    final category = KnowledgeCatalog.categoryById(categoryId);
    final size = KnowledgeCatalog.sizeById(sizeId);
    if (category == null || size == null) {
      return const FeaturePage(
        title: 'Knowledge Catalog',
        showBackButton: true,
        child: EmptyState(
          title: 'Step not found',
          message: 'Go back and choose a category and business size.',
        ),
      );
    }

    return FeaturePage(
      title: 'Type of knowledge',
      subtitle: '${category.name} · ${size.label}',
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
          for (final type in KnowledgeCatalog.types) ...[
            DirectoryTile(
              title: type.name,
              subtitle: type.summary,
              cover: type.id == 'packaging'
                  ? CoverKind.packaging
                  : type.id == 'licensing'
                  ? CoverKind.document
                  : coverForId(category.id),
              onTap: () => context.push(
                AppRoutes.catalogType(category.id, size.id, type.id),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
