
import 'package:json_annotation/json_annotation.dart';

part 'message_teacher_model.g.dart';

@JsonSerializable()
class MessageTeacherModel {
  String instituteName;
  String theMessage;
  String id;

  MessageTeacherModel(this.instituteName, this.theMessage, this.id);
  factory MessageTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$MessageTeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageTeacherModelToJson(this);
}
