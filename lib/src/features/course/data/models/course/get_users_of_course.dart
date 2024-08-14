import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/course_model/course_data_model.dart';
part 'get_users_of_course.g.dart';

@JsonSerializable()
class GetUsersOfCourse {
  String status;
  CourseDataModel data;
  GetUsersOfCourse({
    required this.status,
    required this.data,
  });

  factory GetUsersOfCourse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersOfCourseFromJson(json);
  Map<String, dynamic> toJson() => _$GetUsersOfCourseToJson(this);
}
