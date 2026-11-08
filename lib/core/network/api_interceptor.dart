import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'dio_error_handler.dart';
import 'network_info.dart';

/// Centralized Dio Interceptor strictly responsible for HTTP Pipeline Middleware:
/// Pre-flight network check, attaching headers, and delegating errors to [DioErrorHandler].
class ApiInterceptor extends Interceptor {
  final NetworkInfo networkInfo;

  ApiInterceptor({required this.networkInfo});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 1. Pre-Flight Connectivity Check (Edge Case: Instant fail if no internet, 0ms wait)
    final isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: const NetworkException(),
          message: 'No Internet Connection. Please check your network.',
        ),
      );
    }

    // 2. Standard Headers
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Check if the error was our pre-flight NetworkException
    if (err.error is NetworkException) {
      return handler.reject(err);
    }

    // Delegate error mapping to the dedicated DioErrorHandler (SRP)
    final serverException = DioErrorHandler.handle(err);

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: serverException,
        message: serverException.message,
      ),
    );
  }
}
