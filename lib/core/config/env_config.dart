import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Supported application flavors for multi-environment architecture.
enum AppFlavor { dev, staging, prod }

/// Type-safe Environment Configuration loaded strictly from flavor-specific `.env` file.
///
/// Follows the "Fail-Fast" principle: Throws an explicit error if critical
/// environment variables are missing, ensuring ZERO hardcoded fallback URLs.
class EnvConfig {
  EnvConfig._();

  static AppFlavor _flavor = AppFlavor.dev;

  /// Current active flavor (dev, staging, prod)
  static AppFlavor get flavor => _flavor;

  /// Whether current build is in development mode
  static bool get isDev => _flavor == AppFlavor.dev;

  /// Whether current build is in staging mode
  static bool get isStaging => _flavor == AppFlavor.staging;

  /// Whether current build is in production mode
  static bool get isProd => _flavor == AppFlavor.prod;

  /// Loads the flavor-specific environment file. Must be called in `main()` before `runApp()`.
  static Future<void> init({AppFlavor flavor = AppFlavor.dev}) async {
    _flavor = flavor;
    final fileName = switch (flavor) {
      AppFlavor.dev => '.env.dev',
      AppFlavor.staging => '.env.staging',
      AppFlavor.prod => '.env.prod',
    };
    await dotenv.load(fileName: fileName);
  }

  /// Helper to safely retrieve required environment variables or throw an explicit error.
  static String _getRequired(String key) {
    final value = dotenv.env[key];
    if (value == null || value.trim().isEmpty) {
      throw StateError(
        'CRITICAL CONFIG ERROR: "$key" is not defined or empty in .env file. '
        'Please check your .env file or copy from .env.example.',
      );
    }
    return value.trim();
  }

  /// Backend Base API URL (Strictly read from .env)
  static String get baseUrl => _getRequired('BASE_URL');

  /// Current environment name (development, staging, production)
  static String get environment => _getRequired('ENVIRONMENT');

  /// Connection timeout in milliseconds
  static int get connectTimeout => int.parse(_getRequired('CONNECT_TIMEOUT'));

  /// Receive timeout in milliseconds
  static int get receiveTimeout => int.parse(_getRequired('RECEIVE_TIMEOUT'));
}
