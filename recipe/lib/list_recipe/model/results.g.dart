// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Results _$$_ResultsFromJson(Map<String, dynamic> json) => _$_Results(
      (json['pk'] as num?)?.toDouble(),
      json['title'] as String?,
      json['publisher'] as String?,
      json['featured_image'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['source_url'] as String?,
      json['description'] as String?,
      json['cooking_instructions'] as String?,
      (json['ingredients'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['date_added'] as String?,
      json['date_updated'] as String?,
      (json['long_date_added'] as num?)?.toDouble(),
      (json['long_date_updated'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ResultsToJson(_$_Results instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'title': instance.title,
      'publisher': instance.publisher,
      'featured_image': instance.featured_image,
      'rating': instance.rating,
      'source_url': instance.source_url,
      'description': instance.description,
      'cooking_instructions': instance.cooking_instructions,
      'ingredients': instance.ingredients,
      'date_added': instance.date_added,
      'date_updated': instance.date_updated,
      'long_date_added': instance.long_date_added,
      'long_date_updated': instance.long_date_updated,
    };
