import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/user/data/models/credentialId_model.dart';
import 'package:learning_system/src/features/user/data/models/progress_model.dart';

import 'courses_content_model.dart';

part 'data_user_model.g.dart';

@JsonSerializable()
class DataUserModel {
  @JsonKey(
      name: "credentialId",
      fromJson: _credentialIdFromJson,
      toJson: _credentialIdToJson)
  CredentialIdModel credentialId;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "birthDate")
  DateTime birthDate;
  @JsonKey(name: "finishedCourses")
  List<CoursesModel>? finishedCourses;
  @JsonKey(name: "enrolledCourses")
  List<CoursesModel>? enrolledCourses;
  @JsonKey(name: "wishlist")
  List<String>? wishlist;
  @JsonKey(name: "progress")
  List<ProgressModel>? progress;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "id")
  String id;

  DataUserModel(
      {required this.id,
      required this.credentialId,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      this.finishedCourses,
      this.enrolledCourses,
      this.wishlist,
      this.progress,
      required this.createdAt,
      required this.updatedAt});

  factory DataUserModel.fromJson(Map<String, dynamic> json) =>
      _$DataUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserModelToJson(this);

  static dynamic _credentialIdFromJson(dynamic json) {
    if (json is String) {
      return json;
    } else if (json is Map<String, dynamic>) {
      return CredentialIdModel.fromJson(json);
    } else {
      throw Exception("Invalid type for credentialId");
    }
  }

  static dynamic _credentialIdToJson(dynamic credentialId) {
    if (credentialId is String) {
      return credentialId;
    } else if (credentialId is CredentialIdModel) {
      return credentialId.toJson();
    } else {
      throw Exception("Invalid type for credentialId");
    }
  }
}
