import 'package:ta_iot/bloc/presentation/common/routes/route_generator.dart';
import 'package:ta_iot/bloc/presentation/common/routes/routes.dart';
import 'package:ta_iot/bloc/presentation/common/utils/strings.dart';
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
