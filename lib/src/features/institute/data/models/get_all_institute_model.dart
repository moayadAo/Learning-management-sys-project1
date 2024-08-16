import 'package:json_annotation/json_annotation.dart';
part 'get_all_institute_model.g.dart';

@JsonSerializable()
class GetAllInstituteModel {
  String? status;
  List<Data>? data;

  GetAllInstituteModel({this.status, this.data});

  factory GetAllInstituteModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllInstituteModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllInstituteModelToJson(this);
}

@JsonSerializable()
class Data {
  List<String>? scholarship;
  int? cost;
  String? credentialId;
  String? name;
  int? wallet;
  List<SocialMediaAccounts>? socialMediaAccounts;
  String? createdAt;
  String? updatedAt;
  List<Teachers>? teachers;
  List<StudentScholarship>? studentScholarship;
  List<MyStudent>? myStudent;
  List<PaidStudent>? paidStudent;
  String? id;
  String? image;

  Data({
    this.scholarship,
    this.cost,
    this.credentialId,
    this.name,
    this.wallet,
    this.socialMediaAccounts,
    this.createdAt,
    this.updatedAt,
    this.teachers,
    this.studentScholarship,
    this.myStudent,
    this.paidStudent,
    this.id,
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class SocialMediaAccounts {
  String? facebook;
  String? instgram;

  SocialMediaAccounts({this.facebook, this.instgram});

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

@JsonSerializable()
class StudentScholarship {
  String? studentId;
  String? endDate;
  String? sId;

  StudentScholarship({this.studentId, this.endDate, this.sId});

  factory StudentScholarship.fromJson(Map<String, dynamic> json) =>
      _$StudentScholarshipFromJson(json);

  Map<String, dynamic> toJson() => _$StudentScholarshipToJson(this);
}

@JsonSerializable()
class MyStudent {
  String? studentId;
  String? startDate;
  String? sId;

  MyStudent({this.studentId, this.startDate, this.sId});

  factory MyStudent.fromJson(Map<String, dynamic> json) =>
      _$MyStudentFromJson(json);

  Map<String, dynamic> toJson() => _$MyStudentToJson(this);
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
