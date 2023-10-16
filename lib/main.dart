import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/presentation/common/routes/route_generator.dart';
import 'package:TA_IOT/bloc/presentation/common/routes/routes.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/strings.dart';
import 'package:TA_IOT/bloc/presentation/device_detail/device_detail_screen.dart';
import 'package:flutter/material.dart';
import 'bloc/presentation/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: Strings.appHeader,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
