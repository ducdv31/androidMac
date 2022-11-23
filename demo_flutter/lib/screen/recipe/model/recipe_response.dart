import 'package:demo_flutter/screen/recipe/model/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_response.freezed.dart';
part 'recipe_response.g.dart';

@freezed
class RecipeResponse with _$RecipeResponse {
  const factory RecipeResponse({
    int? count,
    String? next,
    String? previous,
    List<Result>? results,

  }) = _RecipeResponse;

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);
}