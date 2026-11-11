import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:mobiforge/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobiforge/features/auth/domain/repositories/auth_repository.dart';
import 'package:mobiforge/features/auth/domain/usecases/register_usecase.dart';

/// Injectable module providing dependencies for Authentication.
///
/// Follows Dependency Inversion Principle (DIP):
/// Decouples Domain use cases from DI annotations while providing factory wiring.
@module
abstract class AuthModule {
  /// Provides the Retrofit declarative REST client for Auth operations.
  @lazySingleton
  AuthRemoteDataSource authRemoteDataSource(Dio dio) =>
      AuthRemoteDataSource(dio);

  /// Provides the [RegisterUseCase] business operation.
  @lazySingleton
  RegisterUseCase registerUseCase(AuthRepository repository) =>
      RegisterUseCase(repository);
}
