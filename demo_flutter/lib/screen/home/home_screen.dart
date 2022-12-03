import 'package:demo_flutter/screen/recipe/recipe_screen.dart';
import 'package:flutter/material.dart';
import '../common/screen_component.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Dang Duc"),
      body: PageView(
        controller: pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (page) {},
        children: const [RecipeScreen(), RecipeScreen()],
      ),
    );
  }
}
