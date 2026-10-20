import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/app_select_field.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/guide_video_card.dart';
import 'package:food_doctor/core/widgets/primary_button.dart';
import 'package:food_doctor/core/widgets/section_header.dart';
import 'package:food_doctor/features/knowledge/data/knowledge_catalog.dart';
import 'package:food_doctor/features/knowledge/domain/knowledge_models.dart';
import 'package:go_router/go_router.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  FoodCategory? _category;
  BusinessSize? _size;
  KnowledgeType? _type;

  void _search() {
    final category = _category;
    final size = _size;
    final type = _type;
    if (category == null || size == null || type == null) {
      return;
    }
    context.push(
      AppRoutes.catalogType(category.id, size.id, type.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FeaturePage(
      title: l10n.knowledgeCatalog,
      subtitle: l10n.foodCategories,
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
          SectionHeader(title: l10n.advancedSearch),
          const SizedBox(height: AppSpacing.sm),
          ContentCard(
            child: Column(
              children: [
                AppSelectField<FoodCategory>(
                  label: l10n.category,
                  value: _category,
                  options: KnowledgeCatalog.categories,
                  labelOf: (category) => category.name,
                  onChanged: (value) => setState(() => _category = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppSelectField<BusinessSize>(
                  label: l10n.capacity,
                  value: _size,
                  options: KnowledgeCatalog.sizes,
                  labelOf: (size) => size.label,
                  onChanged: (value) => setState(() => _size = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppSelectField<KnowledgeType>(
                  label: l10n.typeOfKnowledge,
                  value: _type,
                  options: KnowledgeCatalog.types,
                  labelOf: (type) => type.name,
                  onChanged: (value) => setState(() => _type = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                PrimaryButton(
                  label: l10n.search,
                  onPressed: _category != null && _size != null && _type != null
                      ? _search
                      : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionHeader(title: l10n.foodCategories),
          const SizedBox(height: AppSpacing.sm),
          for (final category in KnowledgeCatalog.categories) ...[
            DirectoryTile(
              title: category.name,
              subtitle: category.summary,
              cover: coverForId(category.id),
              onTap: () => context.push(AppRoutes.catalogCategory(category.id)),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
