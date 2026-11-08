import 'package:dio/dio.dart';
import '../errors/exceptions.dart';

/// Pure utility class responsible strictly for translating [DioException]
/// into domain-ready [ServerException] objects.
///
/// Follows Single Responsibility Principle (SRP): Isolates error parsing from interceptors.
class DioErrorHandler {
  DioErrorHandler._();

  /// Converts a [DioException] into a strongly-typed [ServerException]
  static ServerException handle(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerException(
          message: 'Connection timeout. Backend server is taking too long to respond.',
          statusCode: 408,
        );

      case DioExceptionType.connectionError:
        return const ServerException(
          message: 'Cannot reach the backend server. Please verify if the server is running on localhost:8080.',
          statusCode: 503,
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final responseData = error.response?.data;

        // Extract error message from server JSON (e.g. {"message": "..."} or {"error": "..."})
        String message = 'Received invalid response from server ($statusCode)';
        if (responseData is Map<String, dynamic>) {
          message = responseData['message']?.toString() ??
              responseData['error']?.toString() ??
              message;
        }

        return ServerException(
          message: message,
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return const ServerException(
          message: 'Request was cancelled by the client.',
        );

      case DioExceptionType.unknown:
      default:
        return ServerException(
          message: error.message ?? 'An unexpected network error occurred.',
        );
    }
  }
}
