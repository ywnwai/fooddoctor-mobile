import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/app_header.dart';
import 'package:food_doctor/core/widgets/profile_card.dart';
import 'package:food_doctor/core/widgets/quick_start_card.dart';
import 'package:food_doctor/core/widgets/section_header.dart';
import 'package:food_doctor/features/home/data/home_preview_data.dart';
import 'package:food_doctor/features/home/domain/home_module.dart';
import 'package:food_doctor/features/home/presentation/home_module_grid.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final profile = HomePreviewData.profile;
    final modules = <HomeModule>[
      HomeModule(
        id: HomeModuleId.knowledge,
        title: l10n.moduleKnowledge,
        subtitle: l10n.moduleKnowledgeSub,
      ),
      HomeModule(
        id: HomeModuleId.blog,
        title: l10n.moduleBlog,
        subtitle: l10n.moduleBlogSub,
      ),
      HomeModule(
        id: HomeModuleId.materials,
        title: l10n.moduleMaterials,
        subtitle: l10n.moduleMaterialsSub,
      ),
      HomeModule(
        id: HomeModuleId.consultants,
        title: l10n.moduleConsultants,
        subtitle: l10n.moduleConsultantsSub,
      ),
      HomeModule(
        id: HomeModuleId.jobs,
        title: l10n.moduleJobs,
        subtitle: l10n.moduleJobsSub,
      ),
      HomeModule(
        id: HomeModuleId.industrial,
        title: l10n.moduleIndustrial,
        subtitle: l10n.moduleIndustrialSub,
      ),
      HomeModule(
        id: HomeModuleId.myRecords,
        title: l10n.moduleMyRecords,
        subtitle: l10n.moduleMyRecordsSub,
      ),
    ];

    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.contentMaxWidth,
          ),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.page,
              AppSpacing.xs,
              AppSpacing.page,
              AppSpacing.lg,
            ),
            children: [
              AppHeader(
                eyebrow: l10n.goodMorning,
                title: l10n.productName,
                actionIcon: Icons.notifications_none_rounded,
                actionTooltip: l10n.notifications,
                onAction: () => context.push(AppRoutes.notifications),
              ),
              const SizedBox(height: AppSpacing.md),
              ProfileCard(
                name: profile.name,
                role: l10n.roleUserEcommerce,
                statusLabel: l10n.loggedIn,
                onTap: () => context.go(AppRoutes.profile),
              ),
              const SizedBox(height: AppSpacing.md),
              QuickStartCard(
                eyebrow: l10n.quickStart,
                title: l10n.quickStartTitle,
                body: l10n.quickStartBody,
                onTap: () => context.go(AppRoutes.catalog),
              ),
              const SizedBox(height: AppSpacing.lg),
              SectionHeader(
                title: l10n.modules,
                trailing: l10n.scopeLabel,
              ),
              const SizedBox(height: AppSpacing.md),
              HomeModuleGrid(modules: modules),
            ],
          ),
        ),
      ),
    );
  }
}
