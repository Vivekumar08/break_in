// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => MenuCategory(
      name: json['Name'] as String,
      items: (json['Items'] as List<dynamic>?)
          ?.map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Items': instance.items,
    };

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => MenuItem(
      id: json['_id'] as String?,
      name: json['ItemName'] as String,
      details: json['Ingredients'] as String,
      price: json['Price'] as int,
      isVeg: json['isVeg'] as bool,
      isAvailable: json['isAvailable'] as bool? ?? true,
    );

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      '_id': instance.id,
      'ItemName': instance.name,
      'Ingredients': instance.details,
      'Price': instance.price,
      'isVeg': MenuItem._toJson(instance.isVeg),
      'isAvailable': instance.isAvailable,
    };
