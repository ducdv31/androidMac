import 'package:recipe/list_recipe/model/results.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_recipes.g.dart';
part 'response_recipes.freezed.dart';

@freezed
class ResponseRecipe with _$ResponseRecipe {
  const factory ResponseRecipe(
      {@Default(0) double count,
      String? next,
      String? previous,
      List<Results>? results}) = _ResponseRecipe;

  factory ResponseRecipe.fromJson(Map<String, dynamic> json) =>
      _$ResponseRecipeFromJson(json);
}
