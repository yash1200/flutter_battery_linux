import 'dart:async';

import 'package:flutter/services.dart';

class Battery {
  static const MethodChannel _channel = const MethodChannel('battery');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map<String, dynamic>> get getBatteryLevel async {
    final Map<String, dynamic> version = Map<String, dynamic>.from(
        await _channel.invokeMethod('getBatteryData'));
    return version;
  }
}
