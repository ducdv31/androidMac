// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      pk: (json['pk'] as num?)?.toDouble(),
      title: json['title'] as String?,
      publisher: json['publisher'] as String?,
      featured_image: json['featured_image'] as String?,
      rating: json['rating'] as int?,
      source_url: json['source_url'] as String?,
      description: json['description'] as String?,
      cooking_instructions: json['cooking_instructions'],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date_added: json['date_added'] as String?,
      date_updated: json['date_updated'] as String?,
      long_date_added: (json['long_date_added'] as num?)?.toDouble(),
      long_date_updated: (json['long_date_updated'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
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
