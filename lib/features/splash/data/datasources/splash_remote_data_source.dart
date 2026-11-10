import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/health_model.dart';

part 'splash_remote_data_source.g.dart';

/// Declarative REST API client generated via Retrofit.
///
/// Follows Interface Segregation & Single Responsibility:
/// Eliminates manual Dio calls, status code checks, and JSON parsing boilerplate.
@RestApi()
abstract class SplashRemoteDataSource {
  factory SplashRemoteDataSource(Dio dio, {String? baseUrl}) = _SplashRemoteDataSource;

  /// Calls the `/health` endpoint to check backend health status.
  /// Automatically binds [CancelToken] via Retrofit's [@CancelRequest] annotation.
  @GET(ApiEndpoints.health)
  Future<HealthModel> checkServerHealth({
    @CancelRequest() CancelToken? cancelToken,
  });
}
