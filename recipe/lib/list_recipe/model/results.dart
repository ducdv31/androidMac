import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  double? pk;
  String? title;
  String? publisher;
  String? featured_image;
  double? rating;
  String? source_url;
  String? description;
  String? cooking_instructions;
  List<String>? ingredients;
  String? date_added;
  String? date_updated;
  double? long_date_added;
  double? long_date_updated;

  Results(
      this.pk,
      this.title,
      this.publisher,
      this.featured_image,
      this.rating,
      this.source_url,
      this.description,
      this.cooking_instructions,
      this.ingredients,
      this.date_added,
      this.date_updated,
      this.long_date_added,
      this.long_date_updated);

  factory Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}