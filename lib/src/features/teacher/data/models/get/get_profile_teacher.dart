import 'package:learning_system/src/features/teacher/data/models/get/message_teacher_model.dart';
import 'package:learning_system/src/features/teacher/data/models/social_media/social_media_model.dart';
import 'package:learning_system/src/features/user/data/models/credentialId_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_profile_teacher.g.dart';

@JsonSerializable()
class GetProfileTeacherModel {
  @JsonKey(name: "credentialId")
  List<CredentialIdModel> credentialId;

  @JsonKey(name: "firstName")
  String firstName;

  @JsonKey(name: "lastName")
  String lastName;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "CV")
  String cv;

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

  @JsonKey(name: "messages")
  List<MessageTeacherModel>? messages;

  GetProfileTeacherModel({
    required this.credentialId,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.cv,
    required this.status,
    required this.wallet,
    required this.subject,
    required this.summery,
    this.socialMediaAccounts,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    this.messages,
  });

  factory GetProfileTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileTeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileTeacherModelToJson(this);
}
