import 'package:json_annotation/json_annotation.dart';

part 'teacher_id_model_new.g.dart';

@JsonSerializable()
class TeacherIdModelNew {
  String firstName;
  String lastName;
  String id;

  TeacherIdModelNew({
    required this.firstName,
    required this.lastName,
    required this.id,
  });

  factory TeacherIdModelNew.fromJson(Map<String, dynamic> json) =>
      _$TeacherIdModelNewFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherIdModelNewToJson(this);
}
