import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recipe/api/apiclient.dart';
import 'package:dio/dio.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:recipe/list_recipe/model/results.dart';
import 'package:recipe/uitls/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PagingController<int, Results> _pagingController = PagingController(
      firstPageKey: 1);

  void getListRecipes(int page) async {
    final dio = Dio();
    dio.options.headers["Authorization"] = Apis.TOKEN;
    ApiClient(dio)
        .getListRecipes(page, "")
        .then((value) {
      var results = value.results;
      var isLastPage = results.length < Const.MAX_ITEM;
      if (isLastPage) {
        _pagingController.appendLastPage(results);
      } else {
        final nextPage = page++;
        _pagingController.appendPage(results, nextPage);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      getListRecipes(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Results>(
            itemBuilder: (context, item, index) => Text(item.title ?? "")
        ));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
