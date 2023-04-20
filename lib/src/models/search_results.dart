import 'package:json_annotation/json_annotation.dart';
part 'generated/search_results.g.dart';

@JsonSerializable()
class SearchResults {
  SearchResults({this.foodPlace, this.foodItems});

  @JsonKey(name: 'foodplace')
  Map<String, String>? foodPlace;

  Map<String, String>? foodItems;

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultsToJson(this);

  int get length => (foodPlace?.length ?? 0) + (foodItems?.length ?? 0);
}
