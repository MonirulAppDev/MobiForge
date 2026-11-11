import 'package:flutter/material.dart';

/// Centralized color palette for MobiForge application.
///
/// Follows Single Responsibility Principle (SRP):
/// Configured with the Signature Orange & Deep Charcoal brand identity.
class AppColors {
  AppColors._();

  // Brand Primary: Vibrant Orange
  static const Color primary = Color(0xFFFF6B00);
  static const Color primaryDark = Color(0xFFEA580C);
  static const Color primaryLight = Color(0xFFFF8533);
  static const Color accent = Color(0xFFFB923C);

  // Background & Surfaces: Deep Charcoal
  static const Color background = Color(0xFF121214);
  static const Color surface = Color(0xFF1C1C20);
  static const Color surfaceLight = Color(0xFF2E2E36);

  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Text Colors
  static const Color textPrimary = Color(0xFFF4F4F5);
  static const Color textSecondary = Color(0xFFA1A1AA);
  static const Color textMuted = Color(0xFF71717A);
}
