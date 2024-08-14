import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';
part 'get_quiz_model.g.dart';

@JsonSerializable()
class GetQuizModel {
  String status;
  QuizDataModel data;

  GetQuizModel({required this.data, required this.status});

  factory GetQuizModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetQuizModelToJson(this);
}
