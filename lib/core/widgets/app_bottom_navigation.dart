import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/l10n/locale_scope.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class AppNavDestination {
  const AppNavDestination({
    required this.id,
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  /// Stable English id used for keys and tests.
  final String id;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final destinations = <AppNavDestination>[
      AppNavDestination(
        id: 'Home',
        label: l10n.navHome,
        icon: Icons.home_outlined,
        selectedIcon: Icons.home_rounded,
      ),
      AppNavDestination(
        id: 'Catalog',
        label: l10n.navCatalog,
        icon: Icons.grid_view_outlined,
        selectedIcon: Icons.grid_view_rounded,
      ),
      AppNavDestination(
        id: 'Materials',
        label: l10n.navMaterials,
        icon: Icons.factory_outlined,
        selectedIcon: Icons.factory_rounded,
      ),
      AppNavDestination(
        id: 'Experts',
        label: l10n.navExperts,
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
      ),
      AppNavDestination(
        id: 'Profile',
        label: l10n.navProfile,
        icon: Icons.account_circle_outlined,
        selectedIcon: Icons.account_circle,
      ),
    ];

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (var index = 0; index < destinations.length; index++)
                Expanded(
                  child: _NavItem(
                    destination: destinations[index],
                    selected: index == currentIndex,
                    onTap: () => onSelected(index),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final AppNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.gold : AppColors.navInactive;
    return Semantics(
      button: true,
      selected: selected ? true : null,
      child: InkWell(
        key: ValueKey('nav-${destination.id}'),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExcludeSemantics(
              child: Icon(
                selected ? destination.selectedIcon : destination.icon,
                color: color,
                size: 24,
              ),
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              destination.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.appText.caption.copyWith(
                color: color,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
