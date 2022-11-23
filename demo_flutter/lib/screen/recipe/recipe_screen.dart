import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo_flutter/screen/recipe/api/recipe_rest_client.dart';
import 'package:demo_flutter/screen/recipe/model/result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_flutter/utils/constant.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: searchRecipe(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Result>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CupertinoActivityIndicator();
            }
            if (snapshot.hasData) {
              return ListRecipeView(
                listData: snapshot.data,
              );
            }
            return const CupertinoActivityIndicator();
          }),
    );
  }

  Future<List<Result>?> searchRecipe() async {
    final dio = Dio();
    dio.options.headers[authorization] = token;
    final client = RecipeRestClient(dio);
    var response = await client.searchRecipe(1, "");
    return response.results;
  }
}

class ListRecipeView extends StatefulWidget {
  const ListRecipeView({this.listData, Key? key}) : super(key: key);

  final List<Result>? listData;

  @override
  State<ListRecipeView> createState() => _ListRecipeViewState();
}

class _ListRecipeViewState extends State<ListRecipeView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width ~/ 400,
        ),
        itemCount: widget.listData?.length ?? 0,
        itemBuilder: (context, index) {
          Result? result = widget.listData?.elementAt(index);
          return ItemRecipe(result: result);
        });
  }
}

class ItemRecipe extends StatefulWidget {
  const ItemRecipe({Key? key, this.result}) : super(key: key);
  final Result? result;

  @override
  State<ItemRecipe> createState() => _ItemRecipeState();
}

class _ItemRecipeState extends State<ItemRecipe> {
  @override
  Widget build(BuildContext context) {
    var result = widget.result;
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: CachedNetworkImage(
              imageUrl: result?.featured_image ?? "",
              placeholder: (context, url) {
                return const CupertinoActivityIndicator();
              },
              fit: BoxFit.fill,
              cacheKey: result?.featured_image,
            ),
          ),
          Text(
            result?.title ?? "",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
