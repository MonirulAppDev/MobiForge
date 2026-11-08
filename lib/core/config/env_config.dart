import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Type-safe Environment Configuration loaded strictly from `.env` file.
///
/// Follows the "Fail-Fast" principle: Throws an explicit error if critical
/// environment variables are missing, ensuring ZERO hardcoded fallback URLs.
class EnvConfig {
  EnvConfig._();

  /// Loads the environment file. Must be called in `main()` before `runApp()`.
  static Future<void> init() async {
    await dotenv.load(fileName: '.env');
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
