import 'package:json_annotation/json_annotation.dart';

part 'get_institute_profile_model.g.dart';

@JsonSerializable()
class GetInstituteProfileModel {
  String? status;
  Data? data;

  GetInstituteProfileModel({this.status, this.data});

  factory GetInstituteProfileModel.fromJson(Map<String, dynamic> json) =>
      _$GetInstituteProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetInstituteProfileModelToJson(this);
}

@JsonSerializable()
class Data {
  CredentialId? credentialId;
  String? name;
  int? wallet;
  List<String>? socialMediaAccounts;
  // List<Null>? teachers;
  // List<Null>? scholarship;
  int? cost;
  // List<Null>? studentScholarship;
  // List<Null>? myStudent;
  // List<Null>? paidStudent;
  String? createdAt;
  String? updatedAt;
  String? id;

  Data(
      {this.credentialId,
      this.name,
      this.wallet,
      this.socialMediaAccounts,
      // this.teachers,
      // this.scholarship,
      this.cost,
      // this.studentScholarship,
      // this.myStudent,
      // this.paidStudent,
      this.createdAt,
      this.updatedAt,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CredentialId {
  String? sId;
  String? email;
  String? password;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CredentialId({
    this.sId,
    this.email,
    this.password,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory CredentialId.fromJson(Map<String, dynamic> json) =>
      _$CredentialIdFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialIdToJson(this);
}
