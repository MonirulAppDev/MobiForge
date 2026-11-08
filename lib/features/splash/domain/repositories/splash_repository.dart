import 'package:mobiforge/core/utils/typedefs.dart';
import '../entities/health_entity.dart';

/// Abstract contract for Splash & Server Health operations.
///
/// Follows SOLID Dependency Inversion Principle (DIP):
/// Domain Layer defines the contract, Data Layer implements it.
abstract class SplashRepository {
  /// Checks whether the backend server is reachable and healthy.
  ResultFuture<HealthEntity> checkServerHealth();
}
