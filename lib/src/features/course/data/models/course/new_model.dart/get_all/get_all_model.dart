import 'package:json_annotation/json_annotation.dart';

import 'data_helper_mode_course.dart';

part 'get_all_model.g.dart';

@JsonSerializable()
class GetAllModelCourseNew {
  String status;
  int result;

  DataHelperModeCourse data;

  GetAllModelCourseNew(
      {required this.data, required this.result, required this.status});

  factory GetAllModelCourseNew.fromJson(Map<String, dynamic> json) =>
      _$GetAllModelCourseNewFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllModelCourseNewToJson(this);
}
