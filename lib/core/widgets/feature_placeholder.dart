import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/widgets/empty_state.dart';

/// Calm holding screen for a module that is not built yet.
class FeaturePlaceholder extends StatelessWidget {
  const FeaturePlaceholder({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.layers_outlined,
    this.onBack,
  });

  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final state = EmptyState(title: title, message: message, icon: icon);
    if (onBack == null) {
      return ColoredBox(
        color: AppColors.background,
        child: SafeArea(bottom: false, child: Center(child: state)),
      );
    }

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Back',
                onPressed: onBack,
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Expanded(child: Center(child: state)),
          ],
        ),
      ),
    );
  }
}
