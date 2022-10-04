// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_recipes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseRecipe _$$_ResponseRecipeFromJson(Map<String, dynamic> json) =>
    _$_ResponseRecipe(
      count: (json['count'] as num?)?.toDouble() ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResponseRecipeToJson(_$_ResponseRecipe instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
