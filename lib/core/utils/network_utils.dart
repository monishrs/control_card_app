import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Helper class to monitor internet connection
class NetworkUtils {
  static final AddressCheckOption _addressCheckOption = AddressCheckOption(
    uri: Uri.parse('https://www.google.com/'),
  );

  static final InternetConnectionChecker _customChecker =
      InternetConnectionChecker.createInstance(
        slowConnectionConfig: const SlowConnectionConfig(
          enableToCheckForSlowConnection: true,
        ),
        addresses: <AddressCheckOption>[_addressCheckOption],
      );
  static StreamSubscription<InternetConnectionStatus>? _subscription;

  /// Stream to listen for connection changes
  static Stream<InternetConnectionStatus> get connectivityStream =>
      _customChecker.onStatusChange;

  /// Checks if the device is currently connected
  static Future<bool> isConnected() async {
    final AddressCheckResult result = await _customChecker.isHostReachable(
      _addressCheckOption,
    );
    debugPrint('isConnected: ${result.isSuccess}');
    return result.isSuccess;
  }

  /// Start listening for internet connection changes
  static void startMonitoring(Function onConnected) {
    _subscription = _customChecker.onStatusChange.listen((
      InternetConnectionStatus status,
    ) {
      final bool netStatus = status != InternetConnectionStatus.disconnected;
      debugPrint('isConnected: $netStatus');
      if (netStatus) {
        onConnected();
      }
    });
  }

  /// Stop listening
  static void stopMonitoring() {
    _subscription?.cancel();
    _subscription = null;
    _customChecker.dispose();
  }
}
