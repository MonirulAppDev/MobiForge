import 'dart:async';
import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'token_refresher.dart';
import 'token_storage.dart';

/// Enterprise QueuedInterceptor that serializes network requests during token expiration.
///
/// Follows SOLID SRP & DIP: Strictly handles queue locking and delegates
/// actual token refreshing to [TokenRefresher].
class AuthInterceptor extends QueuedInterceptor {
  final TokenStorage tokenStorage;
  final TokenRefresher tokenRefresher;
  final Dio dio;

  // Single shared refresh future acting as a mutex lock across concurrent 401 requests
  Future<bool>? _refreshTokenFuture;

  AuthInterceptor({
    required this.tokenStorage,
    required this.tokenRefresher,
    required this.dio,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Inject Bearer token if available
    final token = await tokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final requestOptions = err.requestOptions;

    // Detect 401 Unauthorized (and avoid infinite loops on auth endpoints)
    if (response?.statusCode == 401 && !requestOptions.path.contains('/auth/')) {
      final refreshToken = await tokenStorage.getRefreshToken();

      // If no refresh token exists, reject immediately with AuthException
      if (refreshToken == null || refreshToken.isEmpty) {
        return handler.reject(
          DioException(
            requestOptions: requestOptions,
            response: response,
            type: err.type,
            error: const AuthException(message: 'Authentication required. Please log in.'),
            message: 'Authentication required.',
          ),
        );
      }

      try {
        // Concurrency Lock: Delegate refresh to TokenRefresher abstraction
        _refreshTokenFuture ??= tokenRefresher.refreshTokens(refreshToken);
        final isRefreshed = await _refreshTokenFuture!;

        if (isRefreshed) {
          // Refresh succeeded: Grab new token and update failed request's header
          final newAccessToken = await tokenStorage.getAccessToken();
          requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

          // Replay the request safely
          final retryResponse = await dio.fetch(requestOptions);
          return handler.resolve(retryResponse);
        } else {
          // Refresh failed: Clear credentials and reject
          await tokenStorage.clearTokens();
          return handler.reject(
            DioException(
              requestOptions: requestOptions,
              response: response,
              type: err.type,
              error: const AuthException(message: 'Session expired. Please log in again.'),
              message: 'Session expired.',
            ),
          );
        }
      } catch (e) {
        await tokenStorage.clearTokens();
        return handler.reject(err);
      } finally {
        // Release the mutex lock for future 401 events
        _refreshTokenFuture = null;
      }
    }

    return handler.next(err);
  }
}
