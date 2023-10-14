import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/presentation/device_detail/device_detail_screen.dart';
import 'package:flutter/material.dart';
import 'bloc/presentation/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == "device_detail") {
          final DeviceInfoModel args = settings.arguments as DeviceInfoModel;
          return MaterialPageRoute(
            builder: (context) {
              return DeviceDetailScreen(deviceInfoModel: args);
            },
          );
        }
        assert(false, 'Implementation ${settings.name}');
        return null;
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
