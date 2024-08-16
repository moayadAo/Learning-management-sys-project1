import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/teacher/data/models/social_media/social_media_model.dart';

part 'get_info_teacher_model.g.dart';

@JsonSerializable()
class GetInfoTeacherModel {
  @JsonKey(name: "credentialId")
  String credentialId;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "wallet")
  int wallet;
  @JsonKey(name: "subject")
  String subject;
  @JsonKey(name: "summery")
  String summery;
  @JsonKey(name: "socialMediaAccounts")
  List<SocialMediaAccountsModel>? socialMediaAccounts;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "id")
  String id;

  GetInfoTeacherModel(
      {required this.credentialId,
      required this.firstName,
      required this.lastName,
      required this.image,
      required this.status,
      required this.wallet,
      required this.subject,
      required this.summery,
      this.socialMediaAccounts,
      required this.createdAt,
      required this.updatedAt,
      required this.id});

  factory GetInfoTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$GetInfoTeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetInfoTeacherModelToJson(this);
}
