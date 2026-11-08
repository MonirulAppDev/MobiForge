import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../config/env_config.dart';
import '../logging/app_talker.dart';
import 'api_interceptor.dart';
import 'network_info.dart';
import 'retry_interceptor.dart';

/// Injectable Module for external third-party network dependencies.
@module
abstract class NetworkModule {
  /// Provides singleton instance of [Connectivity]
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  /// Provides singleton implementation of [NetworkInfo]
  @lazySingleton
  NetworkInfo networkInfo(Connectivity connectivity) => NetworkInfoImpl(connectivity);

  /// Provides the custom API interceptor with pre-flight network checks
  @lazySingleton
  ApiInterceptor apiInterceptor(NetworkInfo networkInfo) =>
      ApiInterceptor(networkInfo: networkInfo);

  /// Provides a singleton instance of [Dio] pre-configured with timeouts,
  /// retry mechanism, pre-flight checks, custom headers, and Talker diagnostics.
  @lazySingleton
  Dio dio(ApiInterceptor apiInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvConfig.baseUrl,
        connectTimeout: Duration(milliseconds: EnvConfig.connectTimeout),
        receiveTimeout: Duration(milliseconds: EnvConfig.receiveTimeout),
      ),
    );

    // 1. Auto-Retry Interceptor (handles momentary connection drop with backoff)
    dio.interceptors.add(
      RetryInterceptor(dio: dio),
    );

    // 2. Custom Business Interceptor (Pre-flight network check, Headers & Error handling)
    dio.interceptors.add(apiInterceptor);

    // 3. Talker Diagnostics & In-App Network Inspector
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
