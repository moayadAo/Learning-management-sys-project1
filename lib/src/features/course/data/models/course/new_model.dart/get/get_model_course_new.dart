import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/new_model.dart/get/data_get_model_response.dart';

part 'get_model_course_new.g.dart';

@JsonSerializable()
class GetModelCourseNew {
  String status;
  DataGetModelResponse data;

  GetModelCourseNew({required this.data, required this.status});

  factory GetModelCourseNew.fromJson(Map<String, dynamic> json) =>
      _$GetModelCourseNewFromJson(json);

  Map<String, dynamic> toJson() => _$GetModelCourseNewToJson(this);
}
