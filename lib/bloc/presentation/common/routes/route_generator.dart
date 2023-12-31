import 'package:ta_iot/bloc/data/model/device_model.dart';
import 'package:ta_iot/bloc/presentation/device_detail/device_detail_screen.dart';
import 'package:ta_iot/bloc/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (Uri.parse(settings.name!).path) {
      case '/home':
        return MaterialPageRoute<HomeScreen>(builder: (_) => HomeScreen());

      case '/device_detail':
        return MaterialPageRoute<HomeScreen>(builder: (_) => DeviceDetailScreen(deviceInfoModel: settings.arguments as DeviceInfoModel));

      default:
        return MaterialPageRoute<HomeScreen>(builder: (_) => HomeScreen());
    }
  }
}
