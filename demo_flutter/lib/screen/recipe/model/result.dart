import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
part 'result.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    double? pk,
    String? title,
    String? publisher,
    String? featured_image,
    int? rating,
    String? source_url,
    String? description,
    dynamic cooking_instructions,
    List<String>? ingredients,
    String? date_added,
    String? date_updated,
    double? long_date_added,
    double? long_date_updated
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}