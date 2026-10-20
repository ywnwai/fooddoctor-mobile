import 'package:flutter/material.dart';
import 'package:food_doctor/core/constants/app_colors.dart';

/// Named type roles for Food Doctor.
///
/// Inter is the product font. Roles stay stable so screens do not pick
/// ad-hoc sizes.
@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.display,
    required this.heading,
    required this.title,
    required this.body,
    required this.caption,
    required this.label,
  });

  final TextStyle display;
  final TextStyle heading;
  final TextStyle title;
  final TextStyle body;
  final TextStyle caption;
  final TextStyle label;

  static const fontFamily = 'Inter';

  /// Myanmar glyphs fall back to system fonts when Inter has no coverage.
  static const fontFamilyFallback = <String>[
    'Myanmar Text',
    'Noto Sans Myanmar',
    'Pyidaungsu',
  ];

  static const light = AppTextStyles(
    display: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: 32,
      height: 1.2,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.6,
      color: AppColors.textPrimary,
    ),
    heading: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: 24,
      height: 1.25,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4,
      color: AppColors.textPrimary,
    ),
    title: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: 18,
      height: 1.3,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
      color: AppColors.textPrimary,
    ),
    body: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: 15,
      height: 1.45,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
    caption: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: 12,
      height: 1.35,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    label: TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontSize: 11,
      height: 1.3,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.1,
      color: AppColors.goldInk,
    ),
  );

  @override
  AppTextStyles copyWith({
    TextStyle? display,
    TextStyle? heading,
    TextStyle? title,
    TextStyle? body,
    TextStyle? caption,
    TextStyle? label,
  }) {
    return AppTextStyles(
      display: display ?? this.display,
      heading: heading ?? this.heading,
      title: title ?? this.title,
      body: body ?? this.body,
      caption: caption ?? this.caption,
      label: label ?? this.label,
    );
  }

  @override
  AppTextStyles lerp(ThemeExtension<AppTextStyles>? other, double t) {
    if (other is! AppTextStyles) {
      return this;
    }
    return AppTextStyles(
      display: TextStyle.lerp(display, other.display, t)!,
      heading: TextStyle.lerp(heading, other.heading, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
    );
  }
}

extension AppTextStylesContext on BuildContext {
  AppTextStyles get appText => Theme.of(this).extension<AppTextStyles>()!;
}
