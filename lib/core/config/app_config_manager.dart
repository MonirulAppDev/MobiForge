import 'package:mobiforge/features/splash/domain/entities/mobile_config_entity.dart';

/// Centralized Thread-Safe Application Configuration & Service Registry.
///
/// Follows Single Responsibility Principle (SRP):
/// Holds the dynamically loaded remote configuration in memory, allowing
/// subsequent feature modules (Auth, Catalog, Cart, Payment, etc.) to query
/// dedicated microservice URLs and feature flags without re-fetching.
class AppConfigManager {
  AppConfigManager._();

  static final AppConfigManager instance = AppConfigManager._();

  MobileConfigEntity? _config;

  /// Returns the current active configuration
  MobileConfigEntity? get config => _config;

  /// Whether config has been successfully loaded
  bool get isInitialized => _config != null;

  /// Updates the active configuration in memory
  void updateConfig(MobileConfigEntity config) {
    _config = config;
  }

  /// Active Microservice endpoints
  ConfigServicesEntity? get services => _config?.services;

  /// Active Dynamic Feature flags
  ConfigFeaturesEntity? get features => _config?.features;

  /// Whether the app is currently under system maintenance
  bool get isMaintenanceMode => _config?.maintenanceMode ?? false;

  /// Maintenance message broadcasted from backend
  String get maintenanceMessage =>
      _config?.maintenanceMessage ?? 'System is currently under maintenance.';

  /// Whether force update is mandated
  bool get isForceUpdate => _config?.forceUpdate ?? false;

  /// Minimum required app version
  String get minimumAppVersion => _config?.minimumAppVersion ?? '1.0.0';

  /// Helper to check if a specific feature flag is active
  bool isFeatureEnabled(bool Function(ConfigFeaturesEntity features) predicate) {
    final f = _config?.features;
    if (f == null) return false;
    return predicate(f);
  }
}
