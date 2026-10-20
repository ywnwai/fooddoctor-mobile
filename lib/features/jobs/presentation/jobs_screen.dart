import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/status_badge.dart';
import 'package:food_doctor/features/jobs/data/job_catalog.dart';
import 'package:go_router/go_router.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FeaturePage(
      title: l10n.jobOpportunities,
      subtitle: l10n.foodIndustryCareers,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          for (final job in JobCatalog.jobs) ...[
            DirectoryTile(
              title: job.title,
              subtitle: job.company,
              cover: CoverKind.job,
              trailing: StatusBadge(label: job.status, compact: true),
              onTap: () => context.push(AppRoutes.job(job.id)),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
