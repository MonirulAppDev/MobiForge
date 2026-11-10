import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../network/dio_error_handler.dart';
import '../network/network_info.dart';
import '../utils/typedefs.dart';

/// Base repository class that encapsulates safe network execution and error boundaries.
///
/// Follows DRY (Don't Repeat Yourself) & Single Responsibility (SRP):
/// Eliminates repetitive try-catch blocks across all feature repositories.
abstract class BaseRepository {
  final NetworkInfo networkInfo;

  const BaseRepository({required this.networkInfo});

  /// Executes a network [call] safely with pre-flight offline checks and exhaustive error mapping.
  ///
  /// Guarantees that no low-level [Exception] leaks across the boundary to the Domain layer.
  @protected
  ResultFuture<T> safeNetworkCall<T>(Future<T> Function() call) async {
    // 1. Pre-flight Network Verification (Instant 0ms offline fail)
    if (!await networkInfo.isConnected) {
      return const Left(
        NetworkFailure(message: 'No Internet Connection. Please check your network.'),
      );
    }

    try {
      final result = await call();
      return Right(result);
    } on DioException catch (e) {
      // Unpack custom exceptions attached by ApiInterceptor
      if (e.error is NetworkException) {
        final networkEx = e.error as NetworkException;
        return Left(NetworkFailure(message: networkEx.message));
      }
      if (e.error is ServerException) {
        final serverEx = e.error as ServerException;
        return Left(
          ServerFailure(
            message: serverEx.message,
            statusCode: serverEx.statusCode,
          ),
        );
      }

      // Delegate any raw DioException to the dedicated DioErrorHandler
      final serverEx = DioErrorHandler.handle(e);
      return Left(
        ServerFailure(
          message: serverEx.message,
          statusCode: serverEx.statusCode,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } on FormatException catch (e) {
      return Left(ServerFailure(message: 'Invalid response format: ${e.message}'));
    } on TypeError catch (e) {
      return Left(ServerFailure(message: 'Type parsing error: ${e.toString()}'));
    } catch (e) {
      return Left(
        ServerFailure(message: 'An unexpected error occurred: ${e.toString()}'),
      );
    }
  }
}
