import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/quiz/get_model/get_all_helper_data.dart';
part 'all_get_quiz_model.g.dart';

@JsonSerializable()
class AllGetQuizModel {
  String status;
  GetAllHelperData data;

  AllGetQuizModel({required this.data, required this.status});

  factory AllGetQuizModel.fromJson(Map<String, dynamic> json) =>
      _$AllGetQuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$AllGetQuizModelToJson(this);
}
