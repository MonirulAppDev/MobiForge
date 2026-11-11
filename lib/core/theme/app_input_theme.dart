import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

/// Centralized Input & Form decoration theme configuration.
class AppInputThemeConfig {
  AppInputThemeConfig._();

  /// Builds [InputDecorationTheme] honoring body font size 12 and custom borders.
  static InputDecorationTheme inputDecorationTheme(ColorScheme colors) {
    final isDark = colors.brightness == Brightness.dark;
    final fillColor = isDark
        ? AppColorSchemeConfig.deepCharcoalSurface
        : AppColorSchemeConfig.lightSurface;
    final borderColor = isDark
        ? AppColorSchemeConfig.deepCharcoalBorder
        : AppColorSchemeConfig.lightBorder;
    final hintColor = isDark
        ? const Color(0xFF71717A)
        : const Color(0xFFA1A1AA);

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: hintColor,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: colors.onSurface.withValues(alpha: 0.8),
      ),
      errorStyle: TextStyle(
        fontSize: 11,
        color: colors.error,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colors.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colors.error,
          width: 1.2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: colors.error,
          width: 1.5,
        ),
      ),
    );
  }
}
