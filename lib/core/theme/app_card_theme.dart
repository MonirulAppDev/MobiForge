import 'package:flutter/material.dart';

import 'app_color_scheme.dart';

/// Centralized Card and Surface container theme configuration.
class AppCardThemeConfig {
  AppCardThemeConfig._();

  /// Builds [CardThemeData] with subtle borders and rounded corners.
  static CardThemeData cardTheme(ColorScheme colors) {
    final isDark = colors.brightness == Brightness.dark;
    final cardColor = isDark
        ? AppColorSchemeConfig.deepCharcoalCard
        : AppColorSchemeConfig.lightSurface;
    final borderColor = isDark
        ? AppColorSchemeConfig.deepCharcoalBorder
        : AppColorSchemeConfig.lightBorder;

    return CardThemeData(
      color: cardColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: borderColor, width: 1),
      ),
    );
  }

  /// Builds [DialogThemeData] with matching surface styling.
  static DialogThemeData dialogTheme(ColorScheme colors) {
    final isDark = colors.brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColorSchemeConfig.deepCharcoalSurface
        : AppColorSchemeConfig.lightSurface;

    return DialogThemeData(
      backgroundColor: backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDark
              ? AppColorSchemeConfig.deepCharcoalBorder
              : AppColorSchemeConfig.lightBorder,
        ),
      ),
    );
  }
}
