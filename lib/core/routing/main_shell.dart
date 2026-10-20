import 'package:flutter/material.dart';
import 'package:food_doctor/core/widgets/app_bottom_navigation.dart';
import 'package:food_doctor/core/widgets/app_scaffold.dart';
import 'package:go_router/go_router.dart';

/// Signed-in frame: one bottom navigation, five independent tab stacks.
class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: navigationShell,
      bottomNavigation: AppBottomNavigation(
        currentIndex: navigationShell.currentIndex,
        onSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
