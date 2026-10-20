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

class CapacityScreen extends StatelessWidget {
  const CapacityScreen({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final category = KnowledgeCatalog.categoryById(categoryId);
    if (category == null) {
      return const FeaturePage(
        title: 'Knowledge Catalog',
        showBackButton: true,
        child: EmptyState(
          title: 'Category not found',
          message: 'Choose a food category from the catalog.',
        ),
      );
    }

    return FeaturePage(
      title: category.name,
      subtitle: 'Size of the business',
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
          for (final size in KnowledgeCatalog.sizes) ...[
            DirectoryTile(
              title: size.label,
              subtitle: size.detail,
              cover: coverForId(category.id),
              chip: size.id == 'micro'
                  ? 'Starter'
                  : size.id == 'small'
                  ? 'Small plant'
                  : 'Factory',
              onTap: () => context.push(
                AppRoutes.catalogSize(category.id, size.id),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
