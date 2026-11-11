import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiforge/core/theme/app_color_scheme.dart';
import 'package:mobiforge/core/theme/app_theme.dart';
import 'package:mobiforge/core/theme/app_typography.dart';

void main() {
  group('AppTheme Tests', () {
    testWidgets('Dark theme should be configured with Deep Charcoal and Orange', (tester) async {
      final darkTheme = AppTheme.darkTheme;

      expect(darkTheme.brightness, Brightness.dark);
      expect(darkTheme.colorScheme.primary, AppColorSchemeConfig.primaryOrange);
      expect(darkTheme.colorScheme.surface, AppColorSchemeConfig.deepCharcoal);
      expect(darkTheme.scaffoldBackgroundColor, AppColorSchemeConfig.deepCharcoal);

      // Verify Body Font Size is strictly 12
      expect(darkTheme.textTheme.bodyMedium?.fontSize, 12);
    });

    testWidgets('Light theme should be configured with Clean Surface and Orange', (tester) async {
      final lightTheme = AppTheme.lightTheme;

      expect(lightTheme.brightness, Brightness.light);
      expect(lightTheme.colorScheme.primary, AppColorSchemeConfig.primaryOrange);
      expect(lightTheme.colorScheme.surface, AppColorSchemeConfig.lightBackground);

      // Verify Body Font Size is strictly 12
      expect(lightTheme.textTheme.bodyMedium?.fontSize, 12);
    });

    testWidgets('Typography should use Poppins font family with body font size 12', (tester) async {
      final typography = AppTypographyConfig.darkTextTheme;

      expect(typography.bodyMedium?.fontSize, 12);
      expect(typography.bodySmall?.fontSize, 11);
      expect(typography.bodyLarge?.fontSize, 13);
      expect(typography.headlineSmall?.fontSize, 18);
    });
  });
}
