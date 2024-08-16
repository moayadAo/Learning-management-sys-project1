import 'package:json_annotation/json_annotation.dart';

part 'get_teacher_to_institute_requists_model.g.dart';

@JsonSerializable()
class GetTeacherToInstituteRequistsModel {
  String? status;
  List<Data>? data;

  GetTeacherToInstituteRequistsModel({this.status, this.data});

  factory GetTeacherToInstituteRequistsModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetTeacherToInstituteRequistsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTeacherToInstituteRequistsModelToJson(this);
}

@JsonSerializable()
class Data {
  TeacherToInstitute? teacherToInstitute;
  UserToInstituteByGrant? userToInstituteByGrant;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.teacherToInstitute,
      this.userToInstituteByGrant,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class TeacherToInstitute {
  TeacherId? teacherId;
  InstituteId? instituteId;

  TeacherToInstitute({this.teacherId, this.instituteId});

  factory TeacherToInstitute.fromJson(Map<String, dynamic> json) =>
      _$TeacherToInstituteFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToInstituteToJson(this);
}

@JsonSerializable()
class TeacherId {
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
  // List<Null>? messages;
  String? id;

  TeacherId(
      {this.credentialId,
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
      // this.messages,
      this.id});

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

@JsonSerializable()
class InstituteId {
  String? credentialId;
  String? name;
  int? wallet;
  List<String>? socialMediaAccounts;
  // List<Null>? teachers;
  // List<Null>? scholarship;
  int? cost;
  // List<Null>? studentScholarship;
  // List<Null>? myStudent;
  List<PaidStudent>? paidStudent;
  String? createdAt;
  String? updatedAt;
  String? id;

  InstituteId(
      {this.credentialId,
      this.name,
      this.wallet,
      this.socialMediaAccounts,
      // this.teachers,
      // this.scholarship,
      this.cost,
      // this.studentScholarship,
      // this.myStudent,
      this.paidStudent,
      this.createdAt,
      this.updatedAt,
      this.id});

  factory InstituteId.fromJson(Map<String, dynamic> json) =>
      _$InstituteIdFromJson(json);

  Map<String, dynamic> toJson() => _$InstituteIdToJson(this);
}

@JsonSerializable()
class PaidStudent {
  String? sId;
  String? endDate;

  PaidStudent({this.sId, this.endDate});

  factory PaidStudent.fromJson(Map<String, dynamic> json) =>
      _$PaidStudentFromJson(json);

  Map<String, dynamic> toJson() => _$PaidStudentToJson(this);
}

@JsonSerializable()
class UserToInstituteByGrant {
  // List<Null>? userId;

  UserToInstituteByGrant(
      //this.userId,
      );

  factory UserToInstituteByGrant.fromJson(Map<String, dynamic> json) =>
      _$UserToInstituteByGrantFromJson(json);

  Map<String, dynamic> toJson() => _$UserToInstituteByGrantToJson(this);
}
