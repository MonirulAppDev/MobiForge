import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../config/env_config.dart';
import '../logging/app_talker.dart';
import 'api_interceptor.dart';
import 'auth_interceptor.dart';
import 'cancel_token_manager.dart';
import 'network_info.dart';
import 'retry_interceptor.dart';
import 'token_refresher.dart';
import 'token_storage.dart';

/// Injectable Module for external third-party network dependencies.
@module
abstract class NetworkModule {
  /// Provides singleton instance of [Connectivity]
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  /// Provides singleton implementation of [NetworkInfo]
  @lazySingleton
  NetworkInfo networkInfo(Connectivity connectivity) => NetworkInfoImpl(connectivity);

  /// Provides token storage abstraction
  @lazySingleton
  TokenStorage get tokenStorage => InMemoryTokenStorage();

  /// Dedicated Dio instance specifically for token refreshing.
  /// Reuses [EnvConfig] and [TalkerDioLogger], but intentionally excludes
  /// [AuthInterceptor] to prevent recursive deadlock loops.
  @Named('refreshDio')
  @lazySingleton
  Dio refreshDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.baseUrl,
        connectTimeout: Duration(milliseconds: EnvConfig.connectTimeout),
        receiveTimeout: Duration(milliseconds: EnvConfig.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      TalkerDioLogger(
        talker: AppTalker.instance,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
        ),
      ),
    );

    return dio;
  }

  /// Provides token refresher implementation (DIP), reusing the isolated [refreshDio]
  @lazySingleton
  TokenRefresher tokenRefresher(
    @Named('refreshDio') Dio refreshDio,
    TokenStorage tokenStorage,
  ) =>
      DioTokenRefresher(dio: refreshDio, tokenStorage: tokenStorage);

  /// Provides centralized request cancellation manager
  @lazySingleton
  CancelTokenManager get cancelTokenManager => CancelTokenManager();

  /// Provides the custom API interceptor with pre-flight network checks
  @lazySingleton
  ApiInterceptor apiInterceptor(NetworkInfo networkInfo) =>
      ApiInterceptor(networkInfo: networkInfo);

  /// Provides the primary application [Dio] singleton pre-configured with timeouts,
  /// retry mechanism, pre-flight checks, queued auth refresh, and Talker diagnostics.
  @lazySingleton
  Dio dio(
    ApiInterceptor apiInterceptor,
    TokenStorage tokenStorage,
    TokenRefresher tokenRefresher,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.baseUrl,
        connectTimeout: Duration(milliseconds: EnvConfig.connectTimeout),
        receiveTimeout: Duration(milliseconds: EnvConfig.receiveTimeout),
        sendTimeout: Duration(milliseconds: EnvConfig.connectTimeout),
      ),
    );

    // 1. Auto-Retry Interceptor (handles momentary connection drop with backoff)
    dio.interceptors.add(
      RetryInterceptor(dio: dio),
    );

    // 2. Queued Auth Interceptor (Mutex-locked 401 Token Refresh to prevent race conditions)
    dio.interceptors.add(
      AuthInterceptor(
        tokenStorage: tokenStorage,
        tokenRefresher: tokenRefresher,
        dio: dio,
      ),
    );

    // 3. Custom Business Interceptor (Pre-flight network check, Headers & Error handling)
    dio.interceptors.add(apiInterceptor);

    // 4. Talker Diagnostics & In-App Network Inspector
    dio.interceptors.add(
      TalkerDioLogger(
        talker: AppTalker.instance,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
          printRequestData: true,
          printResponseData: true,
        ),
      ),
    );

    return dio;
  }
}
