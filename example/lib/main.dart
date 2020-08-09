import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:battery/battery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String capacity = "Unknown", technology = "Unknown";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    Map<String, dynamic> batteryDataLocal;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      batteryDataLocal = await Battery.getBatteryLevel;
    } on PlatformException {
      batteryDataLocal = <String, dynamic>{
        'capacity': 'Failed to get capacity',
        'technology': 'Failed to get technology',
      };
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      capacity = batteryDataLocal["capacity"];
      technology = batteryDataLocal["technology"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
            'Battery is : $capacity\nTechnology is : $technology',
          ),
        ),
      ),
    );
  }
}
