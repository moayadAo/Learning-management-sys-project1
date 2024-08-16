import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/question/question_model/question_data_model.dart';

part 'get_question_model.g.dart';

@JsonSerializable()
class GetQuestionModel {
  String status;
  QuestionDataModel data;

  GetQuestionModel({
    required this.data,
    required this.status,
  });

  factory GetQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetQuestionModelToJson(this);
}
