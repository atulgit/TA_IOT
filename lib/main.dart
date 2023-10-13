import 'package:TA_IOT/bloc/presentation/device_detail/device_detail_screen.dart';
import 'package:flutter/material.dart';
import 'bloc/presentation/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DeviceDetailScreen(),
    );
  }
}