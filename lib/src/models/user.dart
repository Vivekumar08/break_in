// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'generated/user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.FullName,
    required this.Email,
    this.PhoneNo,
    this.ProfilePic,
    this.Location,
  });
  final String FullName;
  final String Email;
  final String? PhoneNo;
  final String? ProfilePic;
  final String? Location;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
