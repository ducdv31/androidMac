import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:recipe/list_recipe/recipe_item.dart';
import '../utils/const.dart';
import 'model/results.dart';
import 'package:dio/dio.dart';
import 'package:recipe/api/apiclient.dart';

String nameRecipe = Const.EMPTY;

class ListRecipeScreen extends StatefulWidget {
  const ListRecipeScreen({Key? key}) : super(key: key);

  @override
  State<ListRecipeScreen> createState() => _ListRecipeScreenState();
}

class _ListRecipeScreenState extends State<ListRecipeScreen> {
  final PagingController<int, Results> _pagingController =
      PagingController(firstPageKey: 1);

  void getListRecipes(int page, String name) async {
    final dio = Dio();
    dio.options.headers[Const.Authorization] = Apis.TOKEN;
    ApiClient(dio).getListRecipes(page, nameRecipe).then((value) {
      var results = value.results ?? <Results>[];
      var isLastPage = results.length < Const.MAX_ITEM;
      if (isLastPage) {
        _pagingController.appendLastPage(results);
      } else {
        final nextPage = page + 1;
        _pagingController.appendPage(results, nextPage);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      getListRecipes(pageKey, nameRecipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return PagedGridView(
      pagingController: _pagingController,
      shrinkWrap: true,
      builderDelegate: PagedChildBuilderDelegate<Results>(
        itemBuilder: (context, item, index) => RecipeListItem(results: item),
        newPageProgressIndicatorBuilder: (context) =>
            const CupertinoActivityIndicator(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size ~/ 300,
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
