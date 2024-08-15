import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'social_media_model.g.dart';

@JsonSerializable()

class SocialMediaAccountsModel {
  @JsonKey(name: "faceBook")
  String faceBook;
  @JsonKey(name: "instagram")
  String instagram;

  SocialMediaAccountsModel({required this.faceBook, required this.instagram});

  factory SocialMediaAccountsModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaAccountsModelFromJson(json);
  Map<String, dynamic> toJson() => _$SocialMediaAccountsModelToJson(this);
}
