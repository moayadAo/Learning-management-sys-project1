import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';
part 'update_quiz_model.g.dart';

@JsonSerializable()
class UpdateQuizModel {
  String status;
  QuizDataModel result;
  UpdateQuizModel({
    required this.status,
    required this.result,
  });

  factory UpdateQuizModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateQuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateQuizModelToJson(this);
}
