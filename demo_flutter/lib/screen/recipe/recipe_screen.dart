import 'package:demo_flutter/screen/common/image_component.dart';
import 'package:demo_flutter/screen/common/text_component.dart';
import 'package:demo_flutter/screen/recipe/model/result.dart';
import 'package:demo_flutter/screen/recipe/viewmodel/recipe_viewmodel.dart';
import 'package:demo_flutter/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with AutomaticKeepAliveClientMixin<RecipeScreen> {
  final TextEditingController searchController = TextEditingController();
  final recipeViewModel = RecipeViewModel();
  final scrollRecipeController = ScrollController();
  var page = 1;

  @override
  void initState() {
    super.initState();
    recipeViewModel.searchSink.add("");
    searchController.addListener(() {
      page = 1;
      recipeViewModel.searchSink.add(searchController.text);
    });

    scrollRecipeController.addListener(() {
      if (scrollRecipeController.position.atEdge) {
        var isTop = scrollRecipeController.position.pixels == 0;
        if (!isTop) {
          page++;
          recipeViewModel.searchRecipe(page, searchController.text, true);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    recipeViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: MySearchView(
              textController: searchController,
              labelText: "Search",
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Result>?>(
                stream: recipeViewModel.listRecipeStream,
                builder: (context, snapshot) {
                  print("length ${snapshot.data?.length}");
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  }
                  if (snapshot.hasData) {
                    return ListRecipeView(
                      listData: snapshot.data,
                      scrollController: scrollRecipeController,
                    );
                  }
                  return const CupertinoActivityIndicator();
                }),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ListRecipeView extends StatefulWidget {
  const ListRecipeView({
    this.listData,
    Key? key,
    this.scrollController,
  }) : super(key: key);

  final List<Result>? listData;
  final ScrollController? scrollController;

  @override
  State<ListRecipeView> createState() => _ListRecipeViewState();
}

class _ListRecipeViewState extends State<ListRecipeView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: widget.scrollController,
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
