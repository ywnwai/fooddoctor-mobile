import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';
import 'package:food_doctor/core/constants/app_radius.dart';
import 'package:food_doctor/core/theme/app_typography.dart';

abstract final class AppTheme {
  static ThemeData get light {
    const styles = AppTextStyles.light;
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.navy,
      brightness: Brightness.light,
      primary: AppColors.navy,
      onPrimary: AppColors.white,
      secondary: AppColors.gold,
      onSecondary: AppColors.black,
      error: AppColors.danger,
      onError: AppColors.white,
      surface: AppColors.background,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppTextStyles.fontFamily,
      splashColor: AppColors.gold.withValues(alpha: 0.12),
      highlightColor: AppColors.gold.withValues(alpha: 0.06),
      dividerColor: AppColors.border,
      extensions: const [styles],
      textTheme: TextTheme(
        displayLarge: styles.display,
        headlineMedium: styles.heading,
        titleLarge: styles.title,
        bodyMedium: styles.body,
        bodySmall: styles.caption,
        labelLarge: styles.label,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: styles.title.copyWith(fontWeight: FontWeight.w700),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.navy,
          foregroundColor: AppColors.white,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: styles.body.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.navy,
          minimumSize: const Size.fromHeight(48),
          side: const BorderSide(color: AppColors.navy),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: styles.body.copyWith(
            color: AppColors.navy,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
