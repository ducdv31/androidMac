// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseRecipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseRecipe _$ResponseRecipeFromJson(Map<String, dynamic> json) =>
    ResponseRecipe(
      count: (json['count'] as num).toDouble(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseRecipeToJson(ResponseRecipe instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
