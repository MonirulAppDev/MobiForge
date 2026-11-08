/// Centralized API URLs and Endpoints.
class ApiEndpoints {
  ApiEndpoints._();

  /// Backend Base URL
  /// 
  /// NOTE:
  /// - Windows/macOS/Web/iOS Simulator: `http://localhost:8080`
  /// - Android Emulator: `http://10.0.2.2:8080`
  static const String baseUrl = 'http://localhost:8080';

  /// Health check endpoint: `http://localhost:8080/health`
  static const String health = '/health';
}
