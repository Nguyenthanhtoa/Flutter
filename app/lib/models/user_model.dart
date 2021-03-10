import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  final String token;

  UserModel({this.name, this.email, this.token });

  factory UserModel.fromJson(Map json) => _$UserModelFromJson(json);
 
  Map<String, dynamic> toJSON() => _$UserModelToJson(this);

  @override
  String toString() {
    return json.encode(this);
  }

}