import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/teacher/data/models/get/get_info_teacher_model.dart';

part 'get_all_teacher.g.dart';

@JsonSerializable()
class GetAllTeacherModel {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "data")
  List<GetInfoTeacherModel> data;

  GetAllTeacherModel(this.status, this.data);
  factory GetAllTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllTeacherModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllTeacherModelToJson(this);
}
