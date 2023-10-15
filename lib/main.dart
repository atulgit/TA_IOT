import 'package:TA_IOT/bloc/data/model/device_model.dart';
import 'package:TA_IOT/bloc/presentation/common/routes/RouteGenerator.dart';
import 'package:TA_IOT/bloc/presentation/common/routes/Routes.dart';
import 'package:TA_IOT/bloc/presentation/common/utils/Strings.dart';
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
