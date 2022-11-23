// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeResponse _$$_RecipeResponseFromJson(Map<String, dynamic> json) =>
    _$_RecipeResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipeResponseToJson(_$_RecipeResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
