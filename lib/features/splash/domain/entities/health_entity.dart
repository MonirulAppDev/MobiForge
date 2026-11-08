import 'package:equatable/equatable.dart';

/// Pure business entity representing the Backend Server Health Status.
///
/// Contains NO JSON parsing and NO Flutter UI dependencies.
class HealthEntity extends Equatable {
  final String app;
  final String environment;
  final String status;
  final String time;

  const HealthEntity({
    required this.app,
    required this.environment,
    required this.status,
    required this.time,
  });

  /// Helper getter to quickly check if the backend is operational
  bool get isHealthy => status.toLowerCase() == 'ok';

  @override
  List<Object?> get props => [
        app,
        environment,
        status,
        time,
      ];
}
