import 'package:equatable/equatable.dart';

/// Pure Domain Entity representing the remote dynamic mobile configuration.
///
/// Follows Clean Architecture:
/// Contains pure business rules, zero third-party serialization, zero Flutter UI dependencies.
class MobileConfigEntity extends Equatable {
  final String apiVersion;
  final String environment;
  final bool forceUpdate;
  final String latestAppVersion;
  final String minimumAppVersion;
  final bool maintenanceMode;
  final String maintenanceMessage;
  final bool multiListener;
  final ConfigFeaturesEntity features;
  final ConfigServicesEntity services;

  const MobileConfigEntity({
    required this.apiVersion,
    required this.environment,
    required this.forceUpdate,
    required this.latestAppVersion,
    required this.minimumAppVersion,
    required this.maintenanceMode,
    required this.maintenanceMessage,
    required this.multiListener,
    required this.features,
    required this.services,
  });

  /// Business helper to check if this client is running in development
  bool get isDevelopment => environment.toLowerCase() == 'development';

  /// Business helper to determine if update or maintenance is blocking app usage
  bool get isOperational => !maintenanceMode && !forceUpdate;

  @override
  List<Object?> get props => [
        apiVersion,
        environment,
        forceUpdate,
        latestAppVersion,
        minimumAppVersion,
        maintenanceMode,
        maintenanceMessage,
        multiListener,
        features,
        services,
      ];
}

/// Feature flags enabled dynamically by the backend
class ConfigFeaturesEntity extends Equatable {
  final bool mockAiEnabled;
  final bool mockOtpEnabled;
  final bool mockPaymentEnabled;
  final bool testingToolkit;

  const ConfigFeaturesEntity({
    required this.mockAiEnabled,
    required this.mockOtpEnabled,
    required this.mockPaymentEnabled,
    required this.testingToolkit,
  });

  @override
  List<Object?> get props => [
        mockAiEnabled,
        mockOtpEnabled,
        mockPaymentEnabled,
        testingToolkit,
      ];
}

/// Dynamic microservice endpoint registry provided by backend
class ConfigServicesEntity extends Equatable {
  final String ai;
  final String auth;
  final String catalog;
  final String chat;
  final String commerce;
  final String media;
  final String notifications;
  final String payments;
  final String unified;

  const ConfigServicesEntity({
    required this.ai,
    required this.auth,
    required this.catalog,
    required this.chat,
    required this.commerce,
    required this.media,
    required this.notifications,
    required this.payments,
    required this.unified,
  });

  @override
  List<Object?> get props => [
        ai,
        auth,
        catalog,
        chat,
        commerce,
        media,
        notifications,
        payments,
        unified,
      ];
}
