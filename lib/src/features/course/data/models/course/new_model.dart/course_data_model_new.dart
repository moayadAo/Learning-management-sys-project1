import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/new_model.dart/get_all/teacher_id_model_new.dart';

part 'course_data_model_new.g.dart';

@JsonSerializable()
class CourseDataModelNewForGetAllApi {
  @JsonKey(name: '_id')
  String id;
  String name;
  double? rate;
  double? cost;
  @JsonKey(name: 'Teacher_ID')
  List<TeacherIdModelNew>? teacher;
  @JsonKey(name: 'Categories')
  String? category;
  @JsonKey(name: 'status')
  String? status;
  CourseDataModelNewForGetAllApi(
      {required this.id,
      required this.name,
      this.rate,
      this.cost,
      this.teacher,
      this.category,
      this.status});

  factory CourseDataModelNewForGetAllApi.fromJson(Map<String, dynamic> json) =>
      _$CourseDataModelNewForGetAllApiFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDataModelNewForGetAllApiToJson(this);
}
