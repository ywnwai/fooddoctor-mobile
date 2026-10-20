import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/gold_icon_tile.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.layers_outlined,
  });

  final String title;
  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GoldIconTile(icon: icon, size: 56),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            textAlign: TextAlign.center,
            style: text.title.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(message, textAlign: TextAlign.center, style: text.body),
        ],
      ),
    );
  }
}
