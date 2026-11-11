import 'package:mobiforge/core/usecase/usecase.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';
import 'package:mobiforge/features/splash/domain/repositories/splash_repository.dart';

/// Encapsulates the business operation of verifying backend server health.
///
/// Follows Single Responsibility Principle (SRP):
/// Exactly one use case per operation.
class CheckServerHealthUseCase extends UseCaseWithoutParams<HealthEntity> {
  final SplashRepository repository;

  const CheckServerHealthUseCase(this.repository);

  @override
  ResultFuture<HealthEntity> call() => repository.checkServerHealth();
}
