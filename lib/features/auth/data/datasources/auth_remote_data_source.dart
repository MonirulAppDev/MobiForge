import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:mobiforge/core/constants/api_endpoints.dart';
import 'package:mobiforge/features/auth/data/models/register_request_model.dart';
import 'package:mobiforge/features/auth/data/models/register_response_model.dart';

part 'auth_remote_data_source.g.dart';

/// Declarative REST API client for Authentication operations generated via Retrofit.
///
/// Follows Interface Segregation & Single Responsibility:
/// Eliminates manual HTTP status checks and serialization boilerplate.
@RestApi()
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String? baseUrl}) = _AuthRemoteDataSource;

  /// Calls `/auth/register` to create a new user account.
  @POST(ApiEndpoints.register)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestModel request, {
    @CancelRequest() CancelToken? cancelToken,
  });
}
