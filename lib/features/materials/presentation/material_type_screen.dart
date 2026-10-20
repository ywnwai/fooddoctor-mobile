import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/features/materials/data/material_catalog.dart';
import 'package:go_router/go_router.dart';

class MaterialTypeScreen extends StatelessWidget {
  const MaterialTypeScreen({super.key, required this.typeId});

  final String typeId;

  @override
  Widget build(BuildContext context) {
    final type = MaterialCatalog.typeById(typeId);
    final items = MaterialCatalog.itemsFor(typeId);
    if (type == null || items.isEmpty) {
      return const FeaturePage(
        title: 'Materials',
        showBackButton: true,
        child: EmptyState(
          title: 'Type not found',
          message: 'Go back and choose a material or machine type.',
        ),
      );
    }

    return FeaturePage(
      title: type.name,
      subtitle: 'Items',
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          for (final item in items) ...[
            DirectoryTile(
              title: item.name,
              subtitle: item.hotline,
              cover: coverForId(type.id),
              chip: 'Hot line',
              onTap: () => context.push(
                AppRoutes.materialItem(type.id, item.id),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
