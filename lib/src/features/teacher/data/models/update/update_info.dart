import 'package:json_annotation/json_annotation.dart';

part 'update_info.g.dart';

@JsonSerializable()
class UpdateInfoTeacher {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "data")
  String data;

  UpdateInfoTeacher({required this.status, required this.data});

  factory UpdateInfoTeacher.fromJson(Map<String, dynamic> json) =>
      _$UpdateInfoTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateInfoTeacherToJson(this);
}
