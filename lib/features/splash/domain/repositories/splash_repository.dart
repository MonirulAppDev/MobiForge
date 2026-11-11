import 'package:mobiforge/core/utils/typedefs.dart';
import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';

/// Domain repository contract defining mobile configuration retrieval.
///
/// Follows Dependency Inversion Principle (DIP):
/// Domain defines the contract; Data layer provides the implementation.
abstract class SplashRepository {
  /// Fetches remote mobile configuration from `/mobile/config`.
  ResultFuture<MobileConfigEntity> getMobileConfig();
}
