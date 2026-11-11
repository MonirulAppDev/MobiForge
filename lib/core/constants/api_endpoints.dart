import '../config/env_config.dart';

/// Centralized API URLs and Endpoints.
class ApiEndpoints {
  ApiEndpoints._();

  /// Dynamic Base URL loaded from `.env` via [EnvConfig]
  static String get baseUrl => EnvConfig.baseUrl;

  /// Health check endpoint: `/health`
  static const String health = '/health';

  /// Remote Mobile Configuration: `/api/v1/mobile/config`
  static const String mobileConfig = '/api/v1/mobile/config';

  /// User Registration endpoint: `/api/v1/auth/register`
  static const String register = '/api/v1/auth/register';

  /// User Login endpoint: `/api/v1/auth/login`
  static const String login = '/api/v1/auth/login';

  /// Token refresh endpoint: `/api/v1/auth/refresh`
  static const String refreshToken = '/api/v1/auth/refresh';
}
