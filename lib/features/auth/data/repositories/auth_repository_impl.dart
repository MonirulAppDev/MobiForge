import 'package:injectable/injectable.dart';
import 'package:mobiforge/core/repositories/base_repository.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobiforge/features/auth/data/models/register_request_model.dart';
import 'package:mobiforge/features/auth/domain/entities/register_params.dart';
import 'package:mobiforge/features/auth/domain/entities/user_entity.dart';
import 'package:mobiforge/features/auth/domain/repositories/auth_repository.dart';

/// Concrete implementation of [AuthRepository].
///
/// Follows SOLID Principles:
/// - Dependency Inversion Principle (DIP): Implements Domain contract.
/// - Single Responsibility Principle (SRP): Reuses [BaseRepository] for centralized
///   network safety, pre-flight checks, and exception mapping.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required super.networkInfo,
  });

  @override
  ResultFuture<UserEntity> register(RegisterParams params) {
    return safeNetworkCall(() async {
      final request = RegisterRequestModel.fromEntity(params);
      final response = await remoteDataSource.register(request);
      return response.data.toEntity();
    });
  }
}
