import 'package:json_annotation/json_annotation.dart';

part 'scholarship_request_model.g.dart';

@JsonSerializable()
class ScholarshipRequestModel {
  String? status;
  List<Data>? data;

  ScholarshipRequestModel({this.status, this.data});

  factory ScholarshipRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ScholarshipRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScholarshipRequestModelToJson(this);
}

@JsonSerializable()
class Data {
  UserToInstituteByGrant? userToInstituteByGrant;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.userToInstituteByGrant,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class UserToInstituteByGrant {
  String? instituteId;
  String? scholarshipId;
  List<UserId>? userId;

  UserToInstituteByGrant({this.instituteId, this.scholarshipId, this.userId});

  factory UserToInstituteByGrant.fromJson(Map<String, dynamic> json) =>
      _$UserToInstituteByGrantFromJson(json);

  Map<String, dynamic> toJson() => _$UserToInstituteByGrantToJson(this);
}

@JsonSerializable()
class UserId {
  String? credentialId;
  String? firstName;
  String? lastName;
  String? birthDate;
  // List<Null>? finishedCourses;
  // List<Null>? enrolledCourses;
  // List<Null>? wishlist;
  int? wallet;
  // List<Null>? progress;
  String? createdAt;
  String? updatedAt;
  // List<Null>? message;
  String? id;

  UserId({
    this.credentialId,
    this.firstName,
    this.lastName,
    this.birthDate,
    // this.finishedCourses,
    // this.enrolledCourses,
    // this.wishlist,
    this.wallet,
    // this.progress,
    this.createdAt,
    this.updatedAt,
    // this.message,
    this.id,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => _$UserIdFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdToJson(this);
}
