import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/user/data/models/data_user_model.dart';

part 'add_user_model.g.dart';

@JsonSerializable()
class AddUserModel {
  String status;
  DataUserModel data;

  AddUserModel({required this.status, required this.data});
  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserModelToJson(this);
}
