import 'package:demo_flutter/screen/common/image_component.dart';
import 'package:demo_flutter/screen/common/text_component.dart';
import 'package:demo_flutter/screen/recipe/api/recipe_rest_client.dart';
import 'package:demo_flutter/screen/recipe/model/result.dart';
import 'package:demo_flutter/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: widget.listData?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Result? result = widget.listData?.elementAt(index);
          return ItemRecipe(
            result: result,
            onTap: (result) {},
          );
        });
  }
}

class ItemRecipe extends StatefulWidget {
  const ItemRecipe({Key? key, this.result, this.onTap}) : super(key: key);
  final Result? result;
  final ValueSetter<Result?>? onTap;

  @override
  State<ItemRecipe> createState() => _ItemRecipeState();
}

class _ItemRecipeState extends State<ItemRecipe> {
  @override
  Widget build(BuildContext context) {
    var result = widget.result;
    var onTapItem = widget.onTap;
    return Expanded(
      child: InkWell(
        onTap: () {
          onTapItem?.call(result);
        },
        borderRadius: BorderRadius.circular(cornerImageCommon),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: ImageNetwork(imgSrc: result?.featured_image)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextBlack16(text: result?.title),
            )
          ],
        ),
      ),
    );
  }
}
