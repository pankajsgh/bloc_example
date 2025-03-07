

import 'package:flutter/services.dart';

class PlatformSpecific {
  static const platform = MethodChannel('samples.flutter.dev_channel');

  String _batteryLevel = 'Unknown battery level.';

  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    _batteryLevel = batteryLevel;
    return batteryLevel;
  }
}