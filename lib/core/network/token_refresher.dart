import 'package:dio/dio.dart';
import '../constants/api_endpoints.dart';
import 'token_storage.dart';

/// Abstract contract for refreshing expired authentication tokens.
///
/// Follows Dependency Inversion Principle (DIP): Allows [AuthInterceptor]
/// to trigger token refresh without holding raw endpoints or HTTP implementation details.
abstract class TokenRefresher {
  Future<bool> refreshTokens(String refreshToken);
}

/// Concrete implementation of [TokenRefresher] that reuses the base Dio configuration
/// and centralized [ApiEndpoints.refreshToken].
class DioTokenRefresher implements TokenRefresher {
  final Dio dio;
  final TokenStorage tokenStorage;

  DioTokenRefresher({
    required this.dio,
    required this.tokenStorage,
  });

  @override
  Future<bool> refreshTokens(String refreshToken) async {
    try {
      // Reuses the configured Dio instance and centralized ApiEndpoints
      final response = await dio.post(
        ApiEndpoints.refreshToken,
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final newAccessToken = response.data['access_token']?.toString();
        final newRefreshToken = response.data['refresh_token']?.toString() ?? refreshToken;

        if (newAccessToken != null && newAccessToken.isNotEmpty) {
          await tokenStorage.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken,
          );
          return true;
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
