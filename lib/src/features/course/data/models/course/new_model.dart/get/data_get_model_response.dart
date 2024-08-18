import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/course/course_model/course_data_model.dart';
import 'order_model.dart';

part 'data_get_model_response.g.dart';

@JsonSerializable()
class DataGetModelResponse {
  CourseDataModel basic;
  List<OrderModel> order;

  DataGetModelResponse({
    required this.basic,
    required this.order,
  });

  factory DataGetModelResponse.fromJson(Map<String, dynamic> json) =>
      _$DataGetModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataGetModelResponseToJson(this);
}
