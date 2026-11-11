import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/splash/domain/entities/health_entity.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';

/// Domain repository contract defining Splash & bootstrap operations.
///
/// Follows Dependency Inversion Principle (DIP):
/// Domain defines the contract; Data layer provides the implementation.
abstract class SplashRepository {
  /// Checks backend health status at `/health`.
  ResultFuture<HealthEntity> checkServerHealth();

  /// Fetches remote mobile configuration from `/mobile/config`.
  ResultFuture<MobileConfigEntity> getMobileConfig();
}
