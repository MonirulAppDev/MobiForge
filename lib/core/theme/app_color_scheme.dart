import 'package:flutter/material.dart';

/// Semantic palette and Material 3 ColorScheme builder.
///
/// Follows Single Responsibility Principle (SRP):
/// Centralizes all color definitions combining vibrant Orange with Deep Charcoal.
class AppColorSchemeConfig {
  AppColorSchemeConfig._();

  // Vibrant Orange Accents & Brand Primaries
  static const Color primaryOrange = Color(0xFFFF6B00);
  static const Color primaryOrangeDark = Color(0xFFEA580C);
  static const Color primaryOrangeLight = Color(0xFFFF8533);
  static const Color secondaryAmber = Color(0xFFF59E0B);

  // Deep Charcoal (Dark Theme Neutrals)
  static const Color deepCharcoal = Color(0xFF121214);
  static const Color deepCharcoalSurface = Color(0xFF1C1C20);
  static const Color deepCharcoalCard = Color(0xFF232328);
  static const Color deepCharcoalBorder = Color(0xFF2E2E36);

  // Light Theme Neutrals
  static const Color lightBackground = Color(0xFFF9F9FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFF4F4F6);
  static const Color lightBorder = Color(0xFFE4E4E7);

  // Status & Feedback Colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  /// Material 3 ColorScheme for Dark Theme (Deep Charcoal + Orange)
  static ColorScheme get darkColorScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: primaryOrange,
        onPrimary: Colors.white,
        primaryContainer: primaryOrangeDark,
        onPrimaryContainer: Colors.white,
        secondary: secondaryAmber,
        onSecondary: Colors.black,
        surface: deepCharcoal,
        onSurface: Color(0xFFF4F4F5),
        surfaceContainerLowest: Color(0xFF0D0D0E),
        surfaceContainerLow: deepCharcoal,
        surfaceContainer: deepCharcoalSurface,
        surfaceContainerHigh: deepCharcoalCard,
        surfaceContainerHighest: deepCharcoalBorder,
        outline: deepCharcoalBorder,
        outlineVariant: Color(0xFF3F3F46),
        error: error,
        onError: Colors.white,
      );

  /// Material 3 ColorScheme for Light Theme (Clean White/Charcoal + Orange)
  static ColorScheme get lightColorScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: primaryOrange,
        onPrimary: Colors.white,
        primaryContainer: Color(0xFFFFEDD5),
        onPrimaryContainer: primaryOrangeDark,
        secondary: secondaryAmber,
        onSecondary: Colors.white,
        surface: lightBackground,
        onSurface: Color(0xFF18181B),
        surfaceContainerLowest: Colors.white,
        surfaceContainerLow: lightBackground,
        surfaceContainer: lightSurface,
        surfaceContainerHigh: lightCard,
        surfaceContainerHighest: lightBorder,
        outline: lightBorder,
        outlineVariant: Color(0xFFD4D4D8),
        error: error,
        onError: Colors.white,
      );
}
