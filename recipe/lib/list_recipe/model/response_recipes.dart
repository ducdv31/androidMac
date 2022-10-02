import 'package:json_annotation/json_annotation.dart';
import 'package:recipe/list_recipe/model/results.dart';

part 'response_recipes.g.dart';

@JsonSerializable()
class ResponseRecipe {
  double count;
  String? next;
  String? previous;
  List<Results> results;

  ResponseRecipe({required this.count, this.next, this.previous, required this.results});

  factory ResponseRecipe.fromJson(Map<String, dynamic> json) => _$ResponseRecipeFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseRecipeToJson(this);
}
