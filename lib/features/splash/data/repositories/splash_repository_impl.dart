import 'package:injectable/injectable.dart';
import 'package:mobiforge/core/repositories/base_repository.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/splash/data/datasources/splash_remote_data_source.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';
import 'package:mobiforge/features/splash/domain/repositories/splash_repository.dart';

/// Concrete implementation of [SplashRepository].
///
/// Follows SOLID Principles:
/// - Dependency Inversion Principle (DIP): Implements Domain layer contract.
/// - Single Responsibility Principle (SRP): Reuses [BaseRepository] for centralized error
///   boundaries and focuses strictly on invoking data sources and mapping DTOs to Entities.
@LazySingleton(as: SplashRepository)
class SplashRepositoryImpl extends BaseRepository implements SplashRepository {
  final SplashRemoteDataSource remoteDataSource;

  const SplashRepositoryImpl({
    required this.remoteDataSource,
    required super.networkInfo,
  });

  @override
  ResultFuture<HealthEntity> checkServerHealth() {
    return safeNetworkCall(() async {
      final response = await remoteDataSource.checkServerHealth();
      return response.toEntity();
    });
  }

  @override
  ResultFuture<MobileConfigEntity> getMobileConfig() {
    return safeNetworkCall(() async {
      final response = await remoteDataSource.getMobileConfig();
      return response.data.toEntity();
    });
  }
}
