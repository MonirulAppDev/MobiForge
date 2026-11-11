import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:mobiforge/core/constants/api_endpoints.dart';
import 'package:mobiforge/features/splash/data/models/mobile_config_model.dart';

part 'splash_remote_data_source.g.dart';

/// Declarative REST API client generated via Retrofit.
///
/// Follows Interface Segregation & Single Responsibility:
/// Eliminates manual Dio calls, status code checks, and JSON parsing boilerplate.
@RestApi()
abstract class SplashRemoteDataSource {
  factory SplashRemoteDataSource(Dio dio, {String? baseUrl}) = _SplashRemoteDataSource;

  /// Calls the `/mobile/config` endpoint to retrieve dynamic app configuration.
  /// Automatically binds [CancelToken] via Retrofit's [@CancelRequest] annotation.
  @GET(ApiEndpoints.mobileConfig)
  Future<MobileConfigResponseModel> getMobileConfig({
    @CancelRequest() CancelToken? cancelToken,
  });
}
