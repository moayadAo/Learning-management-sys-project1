import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/getAll/data_all_course_model.dart';

part 'get_all_course_model.g.dart';

@JsonSerializable()
class GetAllCourseModel {
  String status;
  int result;
  DataAllCourseModel data;

  GetAllCourseModel({
    required this.status,
    required this.data,
    required this.result,
  });

  factory GetAllCourseModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllCourseModelToJson(this);
}
