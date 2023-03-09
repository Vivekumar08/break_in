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
      FullName: fields[0] as String,
      Email: fields[1] as String,
      PhoneNo: fields[2] as String?,
      ProfilePic: fields[3] as String?,
      Location: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.FullName)
      ..writeByte(1)
      ..write(obj.Email)
      ..writeByte(2)
      ..write(obj.PhoneNo)
      ..writeByte(3)
      ..write(obj.ProfilePic)
      ..writeByte(4)
      ..write(obj.Location);
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
      FullName: json['FullName'] as String,
      Email: json['Email'] as String,
      PhoneNo: json['PhoneNo'] as String?,
      ProfilePic: json['ProfilePic'] as String?,
      Location: json['Location'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'FullName': instance.FullName,
      'Email': instance.Email,
      'PhoneNo': instance.PhoneNo,
      'ProfilePic': instance.ProfilePic,
      'Location': instance.Location,
    };
