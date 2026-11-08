import 'package:mobiforge/core/usecase/usecase.dart';
import 'package:mobiforge/core/utils/typedefs.dart';
import '../entities/health_entity.dart';
import '../repositories/splash_repository.dart';

/// Encapsulates the business operation of checking the backend server health.
///
/// Follows Single Responsibility Principle (SRP): does exactly one business action.
class CheckServerHealthUseCase extends UseCaseWithoutParams<HealthEntity> {
  final SplashRepository _repository;

  const CheckServerHealthUseCase(this._repository);

  @override
  ResultFuture<HealthEntity> call() {
    return _repository.checkServerHealth();
  }
}
