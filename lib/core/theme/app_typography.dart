import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Typography configuration.
///
/// Follows Single Responsibility:
/// Configures GoogleFonts Poppins with explicit body font size 12.
class AppTypographyConfig {
  AppTypographyConfig._();

  static const String fontFamily = 'Poppins';

  /// Builds TextTheme using GoogleFonts.poppins with strict body font size 12.
  static TextTheme createTextTheme(Color textColor, Color mutedColor) {
    final baseTextTheme = TextTheme(
      // Display Styles
      displayLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: textColor,
        letterSpacing: -0.5,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),

      // Headline Styles
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: textColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      // Title Styles
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      // Body Styles (MANDATORY: bodyMedium is strictly 12)
      bodyLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.45,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: mutedColor,
        height: 1.35,
      ),

      // Label Styles
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 0.2,
      ),
      labelMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: mutedColor,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: mutedColor,
        letterSpacing: 0.4,
      ),
    );

    return GoogleFonts.poppinsTextTheme(baseTextTheme);
  }

  /// Dark TextTheme (Light text on Deep Charcoal)
  static TextTheme get darkTextTheme => createTextTheme(
        const Color(0xFFF4F4F5),
        const Color(0xFFA1A1AA),
      );

  /// Light TextTheme (Deep Charcoal text on Light Surface)
  static TextTheme get lightTextTheme => createTextTheme(
        const Color(0xFF18181B),
        const Color(0xFF71717A),
      );
}
