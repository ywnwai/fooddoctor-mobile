import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/features/experts/data/expert_catalog.dart';
import 'package:go_router/go_router.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FeaturePage(
      title: l10n.experts,
      subtitle: l10n.profilesAndInquiry,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          for (final expert in ExpertCatalog.experts) ...[
            DirectoryTile(
              title: expert.name,
              subtitle: expert.role,
              cover: CoverKind.expert,
              chip: l10n.consultant,
              onTap: () => context.push(AppRoutes.expert(expert.id)),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
