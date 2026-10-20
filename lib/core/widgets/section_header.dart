import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.trailing});

  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: text.title.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        if (trailing != null)
          Text(
            trailing!,
            style: text.body.copyWith(fontSize: 13, color: AppColors.textMuted),
          ),
      ],
    );
  }
}
