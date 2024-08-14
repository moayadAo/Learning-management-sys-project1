import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/course_model/course_data_model.dart';

part 'data_all_course_model.g.dart';

@JsonSerializable()
class DataAllCourseModel {
  List<CourseDataModel> courses;

  DataAllCourseModel({required this.courses});

  factory DataAllCourseModel.fromJson(Map<String, dynamic> json) =>
      _$DataAllCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataAllCourseModelToJson(this);
}
