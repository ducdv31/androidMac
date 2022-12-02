import 'package:demo_flutter/route/app_route.dart';
import 'package:demo_flutter/screen/common/screen_component.dart';
import 'package:demo_flutter/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: AppRoute.home,
      routes: {AppRoute.home: (BuildContext context) => const MainScreen()},
    );
  }
}
