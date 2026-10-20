import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

/// Stand-in for the Food Doctor logo until the brand asset is added.
class FoodDoctorMark extends StatelessWidget {
  const FoodDoctorMark({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Text(
        'D',
        style: context.appText.title.copyWith(
          color: AppColors.white,
          fontSize: size * 0.48,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    );
  }
}
