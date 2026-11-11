import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:mobiforge/features/splash/data/datasources/splash_remote_data_source.dart';
import 'package:mobiforge/features/splash/domain/repositories/splash_repository.dart';
import 'package:mobiforge/features/splash/domain/usecases/get_mobile_config_usecase.dart';

/// Injectable module providing dependencies for the Splash / Mobile Config feature.
@module
abstract class SplashModule {
  /// Provides the Retrofit declarative REST client for splash operations.
  @lazySingleton
  SplashRemoteDataSource splashRemoteDataSource(Dio dio) =>
      SplashRemoteDataSource(dio);

  /// Provides the [GetMobileConfigUseCase] business operation.
  /// Kept inside this module to preserve Domain layer purity (zero third-party imports in Domain).
  @lazySingleton
  GetMobileConfigUseCase getMobileConfigUseCase(
    SplashRepository repository,
  ) =>
      GetMobileConfigUseCase(repository);
}
