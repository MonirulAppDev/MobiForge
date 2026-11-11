import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:mobiforge/core/constants/api_endpoints.dart';
import 'package:mobiforge/features/splash/data/models/health_model.dart';
import 'package:mobiforge/features/splash/data/models/mobile_config_model.dart';

part 'splash_remote_data_source.g.dart';

/// Declarative REST API client for splash operations generated via Retrofit.
///
/// Follows Interface Segregation & Single Responsibility:
/// Eliminates manual Dio calls, status code checks, and JSON parsing boilerplate.
@RestApi()
abstract class SplashRemoteDataSource {
  factory SplashRemoteDataSource(Dio dio, {String? baseUrl}) = _SplashRemoteDataSource;

  /// Calls the `/health` endpoint to check backend server health status.
  @GET(ApiEndpoints.health)
  Future<HealthModel> checkServerHealth({
    @CancelRequest() CancelToken? cancelToken,
  });

  /// Calls the `/api/v1/mobile/config` endpoint to retrieve dynamic app configuration.
  @GET(ApiEndpoints.mobileConfig)
  Future<MobileConfigResponseModel> getMobileConfig({
    @CancelRequest() CancelToken? cancelToken,
  });
}
