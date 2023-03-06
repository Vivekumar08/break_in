// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

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
