import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/user/data/models/credentialId_model.dart';

part 'sign_up_teacher_model.g.dart';

@JsonSerializable()
class SignUpTeacherModel {
  String? status;
  Data? data;

  SignUpTeacherModel({this.status, this.data});

  factory SignUpTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpTeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpTeacherModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(
      name: "credentialId",
      fromJson: _credentialIdFromJson,
      toJson: _credentialIdToJson)
  dynamic credentialId;
  String? firstName;
  String? lastName;
  String? image;
  String? cV;
  String? status;
  int? wallet;
  String? subject;
  String? summery;
  List<SocialMediaAccounts>? socialMediaAccounts;
  // List<Null>? messages;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? token;

  Data(
      {this.credentialId,
      this.firstName,
      this.lastName,
      this.image,
      this.cV,
      this.status,
      this.wallet,
      this.subject,
      this.summery,
      this.token,
      this.socialMediaAccounts,
      // this.messages,
      this.createdAt,
      this.updatedAt,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

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

@JsonSerializable()
class SocialMediaAccounts {
  String? faceBook;
  String? instagram;

  SocialMediaAccounts({this.faceBook, this.instagram});

  factory SocialMediaAccounts.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAccountsFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaAccountsToJson(this);
}
