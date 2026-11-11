import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'app_button_theme.dart';
import 'app_card_theme.dart';
import 'app_color_scheme.dart';
import 'app_input_theme.dart';
import 'app_typography.dart';

/// Base Theme Configuration & Aggregator for MobiForge.
///
/// Follows Open/Closed & Single Responsibility Principles:
/// Assembles individual theme component configurations (Colors, Typography,
/// Buttons, Inputs, Cards, AppBars) into unified [ThemeData] for Light and Dark modes.
class AppTheme {
  AppTheme._();

  /// Dark Theme: Deep Charcoal background with vibrant Orange accents
  static ThemeData get darkTheme {
    final colors = AppColorSchemeConfig.darkColorScheme;
    final typography = AppTypographyConfig.darkTextTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppTypographyConfig.fontFamily,
      colorScheme: colors,
      scaffoldBackgroundColor: colors.surface,
      textTheme: typography,
      elevatedButtonTheme: AppButtonThemeConfig.elevatedButtonTheme(colors),
      outlinedButtonTheme: AppButtonThemeConfig.outlinedButtonTheme(colors),
      textButtonTheme: AppButtonThemeConfig.textButtonTheme(colors),
      inputDecorationTheme: AppInputThemeConfig.inputDecorationTheme(colors),
      appBarTheme: AppBarThemeConfig.darkAppBarTheme(colors),
      cardTheme: AppCardThemeConfig.cardTheme(colors),
      dialogTheme: AppCardThemeConfig.dialogTheme(colors),
      dividerTheme: DividerThemeData(
        color: colors.outline,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColorSchemeConfig.deepCharcoalCard,
        contentTextStyle: typography.bodyMedium?.copyWith(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// Light Theme: Clean soft white with vibrant Orange accents
  static ThemeData get lightTheme {
    final colors = AppColorSchemeConfig.lightColorScheme;
    final typography = AppTypographyConfig.lightTextTheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppTypographyConfig.fontFamily,
      colorScheme: colors,
      scaffoldBackgroundColor: colors.surface,
      textTheme: typography,
      elevatedButtonTheme: AppButtonThemeConfig.elevatedButtonTheme(colors),
      outlinedButtonTheme: AppButtonThemeConfig.outlinedButtonTheme(colors),
      textButtonTheme: AppButtonThemeConfig.textButtonTheme(colors),
      inputDecorationTheme: AppInputThemeConfig.inputDecorationTheme(colors),
      appBarTheme: AppBarThemeConfig.lightAppBarTheme(colors),
      cardTheme: AppCardThemeConfig.cardTheme(colors),
      dialogTheme: AppCardThemeConfig.dialogTheme(colors),
      dividerTheme: DividerThemeData(
        color: colors.outline,
        thickness: 1,
        space: 1,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.onSurface,
        contentTextStyle: typography.bodyMedium?.copyWith(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
