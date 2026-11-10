// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobiforge/core/network/api_interceptor.dart' as _i882;
import 'package:mobiforge/core/network/cancel_token_manager.dart' as _i346;
import 'package:mobiforge/core/network/network_info.dart' as _i444;
import 'package:mobiforge/core/network/network_module.dart' as _i503;
import 'package:mobiforge/core/network/token_refresher.dart' as _i967;
import 'package:mobiforge/core/network/token_storage.dart' as _i442;
import 'package:mobiforge/features/splash/data/datasources/splash_remote_data_source.dart'
    as _i299;
import 'package:mobiforge/features/splash/data/repositories/splash_repository_impl.dart'
    as _i723;
import 'package:mobiforge/features/splash/domain/repositories/splash_repository.dart'
    as _i647;
import 'package:mobiforge/features/splash/domain/usecases/check_server_health_usecase.dart'
    as _i249;
import 'package:mobiforge/features/splash/splash_module.dart' as _i387;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final splashModule = _$SplashModule();
    gh.lazySingleton<_i895.Connectivity>(() => networkModule.connectivity);
    gh.lazySingleton<_i442.TokenStorage>(() => networkModule.tokenStorage);
    gh.lazySingleton<_i346.CancelTokenManager>(
      () => networkModule.cancelTokenManager,
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.refreshDio(),
      instanceName: 'refreshDio',
    );
    gh.lazySingleton<_i444.NetworkInfo>(
      () => networkModule.networkInfo(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i882.ApiInterceptor>(
      () => networkModule.apiInterceptor(gh<_i444.NetworkInfo>()),
    );
    gh.lazySingleton<_i967.TokenRefresher>(
      () => networkModule.tokenRefresher(
        gh<_i361.Dio>(instanceName: 'refreshDio'),
        gh<_i442.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dio(
        gh<_i882.ApiInterceptor>(),
        gh<_i442.TokenStorage>(),
        gh<_i967.TokenRefresher>(),
      ),
    );
    gh.lazySingleton<_i299.SplashRemoteDataSource>(
      () => splashModule.splashRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i647.SplashRepository>(
      () => _i723.SplashRepositoryImpl(
        remoteDataSource: gh<_i299.SplashRemoteDataSource>(),
        networkInfo: gh<_i444.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i249.CheckServerHealthUseCase>(
      () => splashModule.checkServerHealthUseCase(gh<_i647.SplashRepository>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i503.NetworkModule {}

class _$SplashModule extends _i387.SplashModule {}
