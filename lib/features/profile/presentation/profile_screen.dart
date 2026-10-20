import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/routing/app_routes.dart';
import 'package:food_doctor/core/widgets/directory_tile.dart';
import 'package:food_doctor/core/widgets/feature_page.dart';
import 'package:food_doctor/core/widgets/language_switcher.dart';
import 'package:food_doctor/core/widgets/profile_card.dart';
import 'package:food_doctor/core/widgets/secondary_button.dart';
import 'package:food_doctor/features/profile/presentation/profile_scope.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final account = ProfileScope.of(context);

    return FeaturePage(
      title: l10n.profile,
      subtitle: l10n.profileSubtitle,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.page,
          AppSpacing.xs,
          AppSpacing.page,
          AppSpacing.lg,
        ),
        children: [
          ProfileCard(
            name: account.name,
            role: l10n.roleFor(account.position, account.type),
            statusLabel: l10n.loggedIn,
          ),
          const SizedBox(height: AppSpacing.md),
          const LanguageSwitcher(),
          const SizedBox(height: AppSpacing.md),
          DirectoryTile(
            title: l10n.accountInformation,
            subtitle: l10n.profileSubtitle,
            leading: const _MenuIcon(Icons.badge_outlined),
            onTap: () => context.push(AppRoutes.profileAccount),
          ),
          const SizedBox(height: AppSpacing.sm),
          DirectoryTile(
            title: l10n.resetPassword,
            subtitle: l10n.password,
            leading: const _MenuIcon(Icons.lock_outline_rounded),
            onTap: () => context.push(AppRoutes.profilePassword),
          ),
          const SizedBox(height: AppSpacing.sm),
          DirectoryTile(
            title: l10n.myKnowledgeAssets,
            subtitle: l10n.moduleMyRecordsSub,
            leading: const _MenuIcon(Icons.menu_book_rounded),
            onTap: () => context.push(AppRoutes.profileKnowledge),
          ),
          const SizedBox(height: AppSpacing.sm),
          DirectoryTile(
            title: l10n.myInquiry,
            subtitle: l10n.inquiry,
            leading: const _MenuIcon(Icons.forum_outlined),
            onTap: () => context.push(AppRoutes.profileInquiries),
          ),
          const SizedBox(height: AppSpacing.lg),
          SecondaryButton(
            label: l10n.signOut,
            onPressed: () => context.go(AppRoutes.login),
          ),
        ],
      ),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  const _MenuIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.goldSoft,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: AppColors.goldInk, size: 20),
    );
  }
}
