import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/app_search_bar.dart';
import 'package:food_doctor/core/widgets/app_tab_bar.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/features/materials/data/material_catalog.dart';
import 'package:food_doctor/features/materials/domain/material_item.dart';
import 'package:go_router/go_router.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  var _tab = 0;
  var _query = '';

  static const _tabs = [MaterialTab.raw, MaterialTab.packaging, MaterialTab.machinery];

  @override
  Widget build(BuildContext context) {
    final types = MaterialCatalog.typesFor(_tabs[_tab]).where((type) {
      final query = _query.trim().toLowerCase();
      if (query.isEmpty) {
        return true;
      }
      return type.name.toLowerCase().contains(query);
    }).toList();

    final l10n = context.l10n;
    return FeaturePage(
      title: l10n.materialsMachinery,
      subtitle: l10n.materialsSubtitle,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
            child: AppTabBar(
              tabs: [l10n.rawMaterial, l10n.packaging, l10n.machinery],
              index: _tab,
              onChanged: (index) => setState(() => _tab = index),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              AppSpacing.md,
              AppSpacing.page,
              0,
            ),
            child: AppSearchBar(
              hint: l10n.searchThisTab,
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
          Expanded(
            child: types.isEmpty
                ? const EmptyState(
                    title: 'No match',
                    message: 'Try another material or machine name.',
                    icon: Icons.search_off,
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.page,
                      AppSpacing.md,
                      AppSpacing.page,
                      AppSpacing.lg,
                    ),
                    children: [
                      for (final type in types) ...[
                        DirectoryTile(
                          title: type.name,
                          subtitle: type.summary,
                          cover: coverForId(type.id),
                          onTap: () =>
                              context.push(AppRoutes.materialType(type.id)),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                      ],
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
