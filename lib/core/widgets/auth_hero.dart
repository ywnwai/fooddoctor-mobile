import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_spacing.dart';
import 'package:food_doctor/core/theme/app_typography.dart';
import 'package:food_doctor/core/widgets/food_doctor_mark.dart';

class AuthHero extends StatelessWidget {
  const AuthHero({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final text = context.appText;
    return Column(
      children: [
        const FoodDoctorMark(size: 64),
        const SizedBox(height: AppSpacing.md),
        Text(
          'Food Doctor',
          style: text.heading.copyWith(fontSize: 28, height: 1.1),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          title,
          style: text.title.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(subtitle, textAlign: TextAlign.center, style: text.body),
      ],
    );
  }
}
