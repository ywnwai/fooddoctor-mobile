import 'package:flutter/material.dart';

/// Food Doctor color tokens.
///
/// Brand colors come from the business requirement. The cream, ink, and
/// border tokens follow the home wireframe so the product stays calm.
abstract final class AppColors {
  /// Professional navy. `#000080`.
  static const navy = Color(0xFF000080);

  /// Food-industry green. `#008000`.
  static const green = Color(0xFF008000);

  /// Trending orange. The requirement writes `#FFA50`; the complete hex is `#FFA500`.
  static const orange = Color(0xFFFFA500);

  /// Food Doctor gold, also the logo color. `#DEAE0E`.
  static const gold = Color(0xFFDEAE0E);

  /// Logo black. `#000000`.
  static const black = Color(0xFF000000);

  /// Brand gold darkened so small text stays readable on cream.
  static const goldInk = Color(0xFF8C6A08);

  static const goldSoft = Color(0xFFF8F1D4);
  static const background = Color(0xFFF7F3EA);
  static const card = Color(0xFFFFFDF9);
  static const textPrimary = Color(0xFF1A1814);
  static const textSecondary = Color(0xFF6F6A62);
  static const textMuted = Color(0xFF8A847C);
  static const border = Color(0xFFE6DFD2);
  static const navInactive = Color(0xFF8D887F);
  static const white = Color(0xFFFFFFFF);
  static const danger = Color(0xFF9B2C2C);
}
