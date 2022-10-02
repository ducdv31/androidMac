import 'package:flutter/cupertino.dart';
import 'package:recipe/list_recipe/model/results.dart';
import 'package:recipe/utils/const.dart';

class RecipeListItem extends StatefulWidget {
  final Results results;

  const RecipeListItem({Key? key, required this.results}) : super(key: key);

  @override
  State<RecipeListItem> createState() => _RecipeListItemState();
}

class _RecipeListItemState extends State<RecipeListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          height: MediaQuery.of(context).size.width * 0.30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              widget.results.featured_image ?? Const.EMPTY,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingChunkEvent) {
                if (loadingChunkEvent == null) {
                  return child;
                }
                return const FractionallySizedBox(
                  widthFactor: 0.25,
                  heightFactor: 0.25,
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
          ),
        ),
        Text(widget.results.title ?? Const.EMPTY),
        const SizedBox(height: 12),
      ],
    );
  }
}
