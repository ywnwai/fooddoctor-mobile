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
import 'package:food_doctor/features/industrial/data/supplier_catalog.dart';
import 'package:food_doctor/features/industrial/domain/supplier.dart';
import 'package:go_router/go_router.dart';

class IndustrialScreen extends StatefulWidget {
  const IndustrialScreen({super.key});

  @override
  State<IndustrialScreen> createState() => _IndustrialScreenState();
}

class _IndustrialScreenState extends State<IndustrialScreen> {
  var _tab = 0;
  var _query = '';

  static const _tabs = [
    SupplierTab.raw,
    SupplierTab.additive,
    SupplierTab.machinery,
  ];

  @override
  Widget build(BuildContext context) {
    final suppliers = SupplierCatalog.forTab(_tabs[_tab], query: _query);
    final l10n = context.l10n;
    return FeaturePage(
      title: l10n.industrialDirectory,
      subtitle: l10n.suppliersAtoZ,
      showBackButton: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
            child: AppTabBar(
              tabs: [l10n.rawMaterial, l10n.additive, l10n.machinery],
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
              hint: l10n.searchNamePhoneKeyword,
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
          Expanded(
            child: suppliers.isEmpty
                ? const EmptyState(
                    title: 'No supplier',
                    message: 'Try another keyword or category.',
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
                      for (final supplier in suppliers) ...[
                        DirectoryTile(
                          title: supplier.name,
                          subtitle:
                              '${supplier.phone} · ${supplier.keywords.join(', ')}',
                          cover: switch (supplier.tab) {
                            SupplierTab.raw => CoverKind.raw,
                            SupplierTab.additive => CoverKind.additive,
                            SupplierTab.machinery => CoverKind.machinery,
                          },
                          chip: supplier.keywords.first,
                          onTap: () =>
                              context.push(AppRoutes.supplier(supplier.id)),
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
