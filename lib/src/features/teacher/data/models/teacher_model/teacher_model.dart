
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:learning_system/src/features/teacher/data/models/social_media/social_media_model.dart';
part 'teacher_model.g.dart';

@JsonSerializable()
class TeacherModel {
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: "subject")
  String subject;
  @JsonKey(name: "summery")
  String summery;
  @JsonKey(name: "socialMediaAccounts")
  List<SocialMediaAccountsModel>? socialMediaAccounts;

  TeacherModel(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.subject,
      required this.summery,
      required this.socialMediaAccounts});

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
}
