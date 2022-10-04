import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

part 'results.freezed.dart';

@freezed
class Results with _$Results {
  const factory Results(
      double? pk,
      String? title,
      String? publisher,
      String? featured_image,
      double? rating,
      String? source_url,
      String? description,
      String? cooking_instructions,
      List<String>? ingredients,
      String? date_added,
      String? date_updated,
      double? long_date_added,
      double? long_date_updated) = _Results;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
}
