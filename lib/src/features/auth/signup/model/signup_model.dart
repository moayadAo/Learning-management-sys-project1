import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/user/data/models/data_user_model.dart';

part 'signup_model.g.dart';

@JsonSerializable()
class SignupModel {
  String status;
  @JsonKey(name: 'data', fromJson: DataUserModel.fromJson)
  DataUserModel data;

  SignupModel({required this.data, required this.status});

  factory SignupModel.fromJson(Map<String, dynamic> json) =>
      _$SignupModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupModelToJson(this);
}
