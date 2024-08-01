import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/user/data/models/data_user_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String status;
  String token;
  @JsonKey(
    name: 'data',
    fromJson: DataUserModel.fromJson,
  )
  DataUserModel? data;

  LoginModel({required this.status, required this.token, this.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
