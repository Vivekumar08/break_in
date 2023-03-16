// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fullName: fields[0] as String,
      email: fields[1] as String?,
      phoneNo: fields[2] as String?,
      profilePic: fields[3] as String?,
      location: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phoneNo)
      ..writeByte(3)
      ..write(obj.profilePic)
      ..writeByte(4)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      fullName: json['FullName'] as String,
      email: json['Email'] as String?,
      phoneNo: json['PhoneNo'] as String?,
      profilePic: json['profilePic'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'FullName': instance.fullName,
      'Email': instance.email,
      'PhoneNo': instance.phoneNo,
      'profilePic': instance.profilePic,
      'location': instance.location,
    };
