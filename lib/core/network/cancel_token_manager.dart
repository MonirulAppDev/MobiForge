import 'package:dio/dio.dart';

/// Centralized manager for handling Dio [CancelToken] lifecycles.
///
/// Prevents memory leaks, unmounted widget state updates, and useless background
/// data consumption when users navigate away or quickly trigger multiple actions
/// (e.g., search debounce, screen exit).
class CancelTokenManager {
  final Map<String, CancelToken> _tokens = {};

  /// Creates and registers a new [CancelToken] for a given [tag].
  ///
  /// If an ongoing request with the same [tag] is already running,
  /// it is automatically cancelled with [cancelPreviousReason] to prevent race conditions.
  CancelToken createToken(
    String tag, {
    String cancelPreviousReason = 'Cancelled by newer request for the same operation.',
  }) {
    // Cancel prior request with the same tag if still active
    cancel(tag, reason: cancelPreviousReason);

    final token = CancelToken();
    _tokens[tag] = token;
    return token;
  }

  /// Cancels an active request associated with [tag] and cleans up.
  void cancel(String tag, {String? reason}) {
    final token = _tokens.remove(tag);
    if (token != null && !token.isCancelled) {
      token.cancel(reason ?? 'Request cancelled by user or screen disposal.');
    }
  }

  /// Cancels all active requests across the application (e.g. during User Logout).
  void cancelAll({String? reason}) {
    for (final token in _tokens.values) {
      if (!token.isCancelled) {
        token.cancel(reason ?? 'All requests cancelled by application.');
      }
    }
    _tokens.clear();
  }

  /// Removes a completed token without cancelling
  void remove(String tag) {
    _tokens.remove(tag);
  }

  /// Checks if an active token exists for [tag]
  bool isRunning(String tag) {
    final token = _tokens[tag];
    return token != null && !token.isCancelled;
  }
}
