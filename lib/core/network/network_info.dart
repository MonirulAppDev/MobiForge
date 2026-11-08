import 'package:connectivity_plus/connectivity_plus.dart';

/// Contract for checking device connectivity state across the application.
abstract class NetworkInfo {
  /// Checks whether the device is currently connected to WiFi, Mobile Data, or Ethernet.
  Future<bool> get isConnected;

  /// Stream to listen to real-time network state changes (e.g. WiFi turned on/off).
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

/// Concrete implementation using [Connectivity] package.
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  const NetworkInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return !results.contains(ConnectivityResult.none);
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
