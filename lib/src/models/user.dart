import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'food_place_model.dart';
part 'generated/user.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class User extends HiveObject {
  User({
    required this.fullName,
    this.email,
    this.phoneNo,
    this.profilePic,
    this.location,
  });

  @HiveField(0)
  @JsonKey(name: 'FullName')
  final String fullName;

  @HiveField(1)
  @JsonKey(name: 'Email')
  String? email;

  @HiveField(2)
  @JsonKey(name: 'PhoneNo')
  String? phoneNo;

  @HiveField(3)
  String? profilePic;

  @HiveField(4)
  @JsonKey(fromJson: _fromJson)
  Location? location;

  static Location? _fromJson(var location) => location == null
      ? null
      : Location.fromJson((location as Location).toJson());

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
