import 'package:json_annotation/json_annotation.dart';

part 'get_my_teachers_model.g.dart';

@JsonSerializable()
class GetMyTeacherModel {
  String? status;
  Data? data;

  GetMyTeacherModel({this.status, this.data});

  factory GetMyTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyTeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyTeacherModelToJson(this);
}

@JsonSerializable()
class Data {
  List<Teachers>? teachers;
  String? id;

  Data({this.teachers, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Teachers {
  String? startDate;
  String? endDate;
  TeacherId? teacherId;
  String? sId;

  Teachers({this.startDate, this.endDate, this.teacherId, this.sId});

  factory Teachers.fromJson(Map<String, dynamic> json) =>
      _$TeachersFromJson(json);

  Map<String, dynamic> toJson() => _$TeachersToJson(this);
}

@JsonSerializable()
class TeacherId {
  String? sId;
  String? credentialId;
  String? firstName;
  String? lastName;
  String? image;
  String? status;
  int? wallet;
  String? subject;
  String? summery;
  List<SocialMediaAccounts>? socialMediaAccounts;
  String? createdAt;
  String? updatedAt;
  int? iV;
  // List<Null>? messages;

  TeacherId({
    this.sId,
    this.credentialId,
    this.firstName,
    this.lastName,
    this.image,
    this.status,
    this.wallet,
    this.subject,
    this.summery,
    this.socialMediaAccounts,
    this.createdAt,
    this.updatedAt,
    this.iV,
    // this.messages,
  });

  factory TeacherId.fromJson(Map<String, dynamic> json) =>
      _$TeacherIdFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherIdToJson(this);
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
