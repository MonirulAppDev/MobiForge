import 'package:equatable/equatable.dart';

/// Base Failure class representing all errors passed across Domain & Presentation layers.
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

/// Triggers when remote API (Dio / Retrofit) fails.
class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    super.statusCode,
  });
}

/// Triggers when local database/cache (Hive, SharedPreferences) fails.
class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    super.statusCode,
  });
}

/// Triggers when device has no active internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No Internet Connection. Please check your network.',
    super.statusCode,
  });
}

/// Triggers when user input/data validation fails.
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.statusCode,
  });
}
