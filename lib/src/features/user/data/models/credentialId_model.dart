import 'package:json_annotation/json_annotation.dart';

part 'credentialId_model.g.dart';
@JsonSerializable()
class CredentialIdModel {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "role")
  String role;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;
  @JsonKey(name: "__v")
  int v;
  CredentialIdModel({required this.id,required this.email, required this.password, required this.role,
    required this.createdAt,required this.updatedAt,required this.v});

  factory CredentialIdModel.fromJson(Map<String,dynamic>json)=>_$CredentialIdModelFromJson(json);

  Map<String,dynamic> toJson()=>_$CredentialIdModelToJson(this);
}
