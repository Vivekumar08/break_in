// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generated/user.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class User extends HiveObject {
  User({
    required this.FullName,
    this.Email,
    this.PhoneNo,
    this.ProfilePic,
    this.Location,
  });
  @HiveField(0)
  final String FullName;
  @HiveField(1)
  final String? Email;
  @HiveField(2)
  final String? PhoneNo;
  @HiveField(3)
  final String? ProfilePic;
  @HiveField(4)
  final String? Location;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
