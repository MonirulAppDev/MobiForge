/// Low-level exceptions thrown strictly in the Data Layer (Datasources).
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  const ServerException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'ServerException: $message (statusCode: $statusCode)';
}

/// Thrown when Hive / SharedPreferences read-write operations fail.
class CacheException implements Exception {
  final String message;

  const CacheException({required this.message});

  @override
  String toString() => 'CacheException: $message';
}

/// Thrown when device has no active internet during an API call.
class NetworkException implements Exception {
  final String message;

  const NetworkException({this.message = 'No Internet Connection'});

  @override
  String toString() => 'NetworkException: $message';
}

/// Thrown when unauthorized or token expired.
class AuthException implements Exception {
  final String message;

  const AuthException({required this.message});

  @override
  String toString() => 'AuthException: $message';
}
