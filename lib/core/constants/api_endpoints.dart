import '../config/env_config.dart';

/// Centralized API URLs and Endpoints.
class ApiEndpoints {
  ApiEndpoints._();

  /// Dynamic Base URL loaded from `.env` via [EnvConfig]
  static String get baseUrl => EnvConfig.baseUrl;

  /// Health check endpoint: `/health`
  static const String health = '/health';

  /// Token refresh endpoint: `/auth/refresh`
  static const String refreshToken = '/auth/refresh';
}
