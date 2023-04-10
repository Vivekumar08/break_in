// ignore_for_file: constant_identifier_names
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';
part 'generated/food_place_model.g.dart';

@JsonSerializable()
class FoodPlaceModel {
  FoodPlaceModel({
    required this.id,
    required this.name,
    required this.status,
    required this.category,
    required this.foodType,
    required this.image,
    required this.location,
    required this.menu,
    required this.rating,
    required this.ratedBy,
  });

  @JsonKey(name: 'foodPlaceId')
  final String id;

  @JsonKey(name: 'FoodPlaceName')
  final String name;

  bool status;

  final FoodPlaceCategory category;

  @JsonKey(name: 'type')
  final String foodType;

  @JsonKey(name: 'CoverPhoto')
  String image;

  @JsonKey(name: 'Locations')
  final Location location;

  @JsonKey(name: 'Menu')
  List<MenuCategory> menu;

  @JsonKey(name: 'Ratings')
  double? rating;

  @JsonKey(name: 'RatedBy')
  int ratedBy;

  factory FoodPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$FoodPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodPlaceModelToJson(this);
}

enum FoodPlaceCategory { Canteen, Mess, Micro_Cafe, Juice_Corner, Diary_Booth }

@HiveType(typeId: 1)
@JsonSerializable()
class Location {
  Location({
    required this.lat,
    required this.lng,
    required this.address,
    this.landmark,
  });

  @HiveField(0)
  final double lat;

  @HiveField(1)
  final double lng;

  @HiveField(2)
  final String address;

  @HiveField(3)
  final String? landmark;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
