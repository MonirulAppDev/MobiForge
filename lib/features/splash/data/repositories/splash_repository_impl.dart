import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobiforge/core/errors/exceptions.dart';
import 'package:mobiforge/core/errors/failures.dart';
import 'package:mobiforge/core/network/dio_error_handler.dart';
import 'package:mobiforge/core/network/network_info.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import '../../domain/entities/health_entity.dart';
import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_remote_data_source.dart';

/// Concrete implementation of [SplashRepository].
///
/// Follows SOLID Principles:
/// - Dependency Inversion Principle (DIP): Implements Domain layer contract.
/// - Single Responsibility Principle (SRP): Acts as the sole boundary between
///   Domain and external network datasources, converting DTOs to Entities and Exceptions to Failures.
@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const SplashRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  ResultFuture<HealthEntity> checkServerHealth() async {
    // 1. Pre-flight Network Verification
    if (!await networkInfo.isConnected) {
      return const Left(
        NetworkFailure(message: 'No Internet Connection. Please check your network.'),
      );
    }

    try {
      // 2. Fetch Data via Retrofit Remote Data Source
      final model = await remoteDataSource.checkServerHealth();

      // 3. Transform DTO to Pure Domain Entity (Liskov / Layer Isolation)
      return Right(model.toEntity());
    } on DioException catch (e) {
      // DioException may wrap custom exceptions from ApiInterceptor
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

      // Delegate any unhandled DioException to DioErrorHandler
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
