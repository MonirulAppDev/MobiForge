import 'package:mobiforge/core/usecase/usecase.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';
import 'package:mobiforge/features/splash/domain/repositories/splash_repository.dart';

/// Encapsulates the business operation of fetching remote mobile configuration.
///
/// Follows Single Responsibility Principle (SRP):
/// Exactly one use case per operation.
class GetMobileConfigUseCase extends UseCaseWithoutParams<MobileConfigEntity> {
  final SplashRepository repository;

  const GetMobileConfigUseCase(this.repository);

  @override
  ResultFuture<MobileConfigEntity> call() => repository.getMobileConfig();
}
