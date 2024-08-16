import 'package:json_annotation/json_annotation.dart';

part 'accept_teacher_model.g.dart';

@JsonSerializable()
class AcceptTeacherModel {
  String? status;
  Data? data;

  AcceptTeacherModel({this.status, this.data});

  factory AcceptTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$AcceptTeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptTeacherModelToJson(this);
}

@JsonSerializable()
class Data {
  // List<Null>? scholarship;
  int? cost;
  String? credentialId;
  String? name;
  int? wallet;
  List<SocialMediaAccounts>? socialMediaAccounts;
  String? createdAt;
  String? updatedAt;
  List<Teachers>? teachers;
  // List<Null>? studentScholarship;
  // List<Null>? myStudent;
  // List<Null>? paidStudent;
  String? id;

  Data({
    // this.scholarship,
    this.cost,
    this.credentialId,
    this.name,
    this.wallet,
    this.socialMediaAccounts,
    this.createdAt,
    this.updatedAt,
    this.teachers,
    // this.studentScholarship,
    // this.myStudent,
    // this.paidStudent,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class SocialMediaAccounts {
  String? facebook;
  String? instagram;

  SocialMediaAccounts({this.facebook, this.instagram});

  factory SocialMediaAccounts.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAccountsFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaAccountsToJson(this);
}

@JsonSerializable()
class Teachers {
  String? startDate;
  String? endDate;
  String? teacherId;
  String? sId;

  Teachers({this.startDate, this.endDate, this.teacherId, this.sId});

  factory Teachers.fromJson(Map<String, dynamic> json) =>
      _$TeachersFromJson(json);

  Map<String, dynamic> toJson() => _$TeachersToJson(this);
}
