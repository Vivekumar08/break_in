import 'package:json_annotation/json_annotation.dart';
part 'generated/menu.g.dart';

@JsonSerializable()
class MenuCategory {
  MenuCategory({
    required this.name,
    required this.items,
    this.isExpanded = false,
  });

  @JsonKey(name: 'Name')
  final String name;

  @JsonKey(name: 'Items')
  List<MenuItem>? items;

  @JsonKey(includeToJson: false, includeFromJson: false)
  bool isExpanded;

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
}

@JsonSerializable()
class MenuItem {
  MenuItem({
    this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.isVeg,
    this.isAvailable = true,
  });

  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'ItemName')
  final String name;

  @JsonKey(name: 'Ingredients')
  final String details;

  @JsonKey(name: 'Price')
  final int price;

  @JsonKey(toJson: _toJson)
  final bool isVeg;

  bool isAvailable;

  static String _toJson(var value) => value.toString();

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
