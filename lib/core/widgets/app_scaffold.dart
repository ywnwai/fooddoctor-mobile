import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';

/// Page chrome shared by the signed-in shell.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigation,
    this.backgroundColor,
  });

  final Widget body;
  final Widget? bottomNavigation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.background,
      body: body,
      bottomNavigationBar: bottomNavigation,
    );
  }
}
