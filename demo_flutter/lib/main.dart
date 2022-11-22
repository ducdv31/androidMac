import 'package:demo_flutter/route/app_route.dart';
import 'package:demo_flutter/screen/common/screen_component.dart';
import 'package:demo_flutter/screen/recipe/recipe_screen.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Dang Duc"),
      body: MaterialApp(
        initialRoute: AppRoute.home,
        routes: {
          AppRoute.home: (BuildContext context) => RecipeScreen(context)
        },
      ),
    );
  }
}
