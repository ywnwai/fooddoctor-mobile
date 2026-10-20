import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/content_card.dart';
import 'package:food_doctor/core/widgets/cover_art.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/media_placeholder.dart';
import 'package:food_doctor/core/widgets/status_badge.dart';
import 'package:food_doctor/features/jobs/data/job_catalog.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key, required this.jobId});

  final String jobId;

  @override
  Widget build(BuildContext context) {
    final job = JobCatalog.byId(jobId);
    if (job == null) {
      return const FeaturePage(
        title: 'Job',
        showBackButton: true,
        child: EmptyState(
          title: 'Vacancy not found',
          message: 'Go back to the job list.',
        ),
      );
    }
    final text = context.appText;
    return FeaturePage(
      title: job.title,
      subtitle: job.company,
      showBackButton: true,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          const MediaPlaceholder(kind: CoverKind.job, label: 'Plant'),
          const SizedBox(height: AppSpacing.md),
          ContentCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusBadge(label: job.status, compact: true),
                const SizedBox(height: AppSpacing.md),
                Text(job.description, style: text.body.copyWith(height: 1.5)),
                const SizedBox(height: AppSpacing.lg),
                Text('Salary range', style: text.caption),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  job.salary,
                  style: text.title.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text('Contact', style: text.caption),
                const SizedBox(height: AppSpacing.xxs),
                Text(job.contact, style: text.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
