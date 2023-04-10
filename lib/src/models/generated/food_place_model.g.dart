// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../food_place_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 1;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      lat: fields[0] as double,
      lng: fields[1] as double,
      address: fields[2] as String,
      landmark: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.landmark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodPlaceModel _$FoodPlaceModelFromJson(Map<String, dynamic> json) =>
    FoodPlaceModel(
      id: json['foodPlaceId'] as String,
      name: json['FoodPlaceName'] as String,
      status: json['status'] as bool,
      category: $enumDecode(_$FoodPlaceCategoryEnumMap, json['category']),
      foodType: json['type'] as String,
      image: json['CoverPhoto'] as String,
      location: Location.fromJson(json['Locations'] as Map<String, dynamic>),
      menu: (json['Menu'] as List<dynamic>)
          .map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['Ratings'] as num?)?.toDouble(),
      ratedBy: json['RatedBy'] as int,
    );

Map<String, dynamic> _$FoodPlaceModelToJson(FoodPlaceModel instance) =>
    <String, dynamic>{
      'foodPlaceId': instance.id,
      'FoodPlaceName': instance.name,
      'status': instance.status,
      'category': _$FoodPlaceCategoryEnumMap[instance.category]!,
      'type': instance.foodType,
      'CoverPhoto': instance.image,
      'Locations': instance.location,
      'Menu': instance.menu,
      'Ratings': instance.rating,
      'RatedBy': instance.ratedBy,
    };

const _$FoodPlaceCategoryEnumMap = {
  FoodPlaceCategory.Canteen: 'Canteen',
  FoodPlaceCategory.Mess: 'Mess',
  FoodPlaceCategory.Micro_Cafe: 'Micro_Cafe',
  FoodPlaceCategory.Juice_Corner: 'Juice_Corner',
  FoodPlaceCategory.Diary_Booth: 'Diary_Booth',
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      address: json['address'] as String,
      landmark: json['landmark'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'landmark': instance.landmark,
    };
