import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/new_model.dart/course_data_model_new.dart';

part 'data_helper_mode_course.g.dart';

@JsonSerializable()
class DataHelperModeCourse {
  List<CourseDataModelNewForGetAllApi> courses;

  DataHelperModeCourse({required this.courses});

  factory DataHelperModeCourse.fromJson(Map<String, dynamic> json) =>
      _$DataHelperModeCourseFromJson(json);
  Map<String, dynamic> toJson() => _$DataHelperModeCourseToJson(this);
}
