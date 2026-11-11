import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

/// Centralized Button theme configuration for elevated, outlined, and text buttons.
class AppButtonThemeConfig {
  AppButtonThemeConfig._();

  /// Configures [ElevatedButtonThemeData] with orange accent and rounded corners.
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
        disabledBackgroundColor: colors.primary.withValues(alpha: 0.4),
        disabledForegroundColor: Colors.white70,
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  /// Configures [OutlinedButtonThemeData] with orange border.
  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colors) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.primary,
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        side: BorderSide(color: colors.primary, width: 1.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Configures [TextButtonThemeData] with primary orange styling.
  static TextButtonThemeData textButtonTheme(ColorScheme colors) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorSchemeConfig.primaryOrange,
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
