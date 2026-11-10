import 'package:flutter/material.dart';

/// Centralized color palette for MobiForge application.
///
/// Follows Single Responsibility Principle (SRP): Isolates UI colors from widgets.
class AppColors {
  AppColors._();

  // Brand Primary & Accents
  static const Color primary = Color(0xFF2563EB); // Royal Blue
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color accent = Color(0xFFF59E0B); // Amber Accent

  // Background & Surfaces
  static const Color background = Color(0xFF0F172A); // Dark Slate background
  static const Color surface = Color(0xFF1E293B); // Surface Card
  static const Color surfaceLight = Color(0xFF334155);

  // Status Colors
  static const Color success = Color(0xFF10B981); // Emerald Green
  static const Color error = Color(0xFFEF4444); // Crimson Red
  static const Color warning = Color(0xFFFBBF24); // Warm Amber
  static const Color info = Color(0xFF38BDF8); // Sky Blue

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC); // White / High contrast
  static const Color textSecondary = Color(0xFF94A3B8); // Muted slate gray
  static const Color textMuted = Color(0xFF64748B);
}
