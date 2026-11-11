import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color_scheme.dart';

/// Centralized AppBar theme configuration for Light and Dark modes.
class AppBarThemeConfig {
  AppBarThemeConfig._();

  /// AppBar configuration for Dark mode (Deep Charcoal)
  static AppBarTheme darkAppBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: AppColorSchemeConfig.deepCharcoal,
      foregroundColor: colors.onSurface,
      centerTitle: true,
      iconTheme: IconThemeData(color: colors.onSurface, size: 22),
      actionsIconTheme: IconThemeData(color: colors.onSurface, size: 22),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        letterSpacing: 0.2,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColorSchemeConfig.deepCharcoal,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  /// AppBar configuration for Light mode
  static AppBarTheme lightAppBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0.5,
      backgroundColor: AppColorSchemeConfig.lightSurface,
      foregroundColor: colors.onSurface,
      centerTitle: true,
      iconTheme: IconThemeData(color: colors.onSurface, size: 22),
      actionsIconTheme: IconThemeData(color: colors.onSurface, size: 22),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
        letterSpacing: 0.2,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColorSchemeConfig.lightBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
