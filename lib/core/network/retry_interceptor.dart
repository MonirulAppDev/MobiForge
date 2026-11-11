import 'dart:io';
import 'package:dio/dio.dart';

/// Interceptor that automatically retries failed network requests
/// due to connection loss or timeouts before giving up.
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final List<Duration> retryDelays;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 2,
    this.retryDelays = const [
      Duration(milliseconds: 800),
      Duration(seconds: 1),
    ],
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final requestOptions = err.requestOptions;

    // Retrieve or initialize the current retry count
    int retryCount = requestOptions.extra['retryCount'] ?? 0;

    // Check if the error is retryable and maxRetries not exceeded
    if (_shouldRetry(err, requestOptions) && retryCount < maxRetries) {
      retryCount++;
      requestOptions.extra['retryCount'] = retryCount;

      // Pick delay according to retry index (exponential backoff)
      final delay = retryDelays[retryCount - 1 < retryDelays.length ? retryCount - 1 : retryDelays.length - 1];
      await Future.delayed(delay);

      try {
        // Re-execute the request with the same options
        final response = await dio.fetch(requestOptions);
        return handler.resolve(response);
      } on DioException catch (retryError) {
        // Pass to next retry or next error handler
        return handler.next(retryError);
      }
    }

    // If not retryable or retries exhausted, forward the error
    return handler.next(err);
  }

  /// Evaluates whether the request should be retried
  bool _shouldRetry(DioException error, RequestOptions requestOptions) {
    // 1. Only retry on transient network errors / timeouts
    final isNetworkError = error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError ||
        error.error is SocketException;

    // 2. Prevent unsafe automatic retries on sensitive non-idempotent operations
    // (Allow GET by default; POST can be explicitly enabled via extra['allowRetry'] = true)
    final isSafeMethod = requestOptions.method.toUpperCase() == 'GET' ||
        requestOptions.extra['allowRetry'] == true;

    return isNetworkError && isSafeMethod;
  }
}
