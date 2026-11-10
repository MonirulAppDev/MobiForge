import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'data/datasources/splash_remote_data_source.dart';
import 'domain/repositories/splash_repository.dart';
import 'domain/usecases/check_server_health_usecase.dart';

/// Injectable module providing dependencies for the Splash / Health check feature.
@module
abstract class SplashModule {
  /// Provides the Retrofit declarative REST client for splash operations.
  @lazySingleton
  SplashRemoteDataSource splashRemoteDataSource(Dio dio) =>
      SplashRemoteDataSource(dio);

  /// Provides the [CheckServerHealthUseCase] business operation.
  /// Kept inside this module to preserve Domain layer purity (zero third-party imports in Domain).
  @lazySingleton
  CheckServerHealthUseCase checkServerHealthUseCase(
    SplashRepository repository,
  ) =>
      CheckServerHealthUseCase(repository);
}
