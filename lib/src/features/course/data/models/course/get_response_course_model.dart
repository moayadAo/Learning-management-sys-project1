import 'package:json_annotation/json_annotation.dart';
import 'course_model/course_data_model.dart'; // Import your existing CourseDataModel

part 'get_response_course_model.g.dart';

@JsonSerializable()
class GetResponseCourseModel {
  String status;
  CourseData data;

  GetResponseCourseModel({
    required this.status,
    required this.data,
  });

  factory GetResponseCourseModel.fromJson(Map<String, dynamic> json) =>
      _$GetResponseCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetResponseCourseModelToJson(this);
}

@JsonSerializable()
class CourseData {
  CourseDataModel course;

  CourseData({required this.course});

  factory CourseData.fromJson(Map<String, dynamic> json) =>
      _$CourseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDataToJson(this);
}
