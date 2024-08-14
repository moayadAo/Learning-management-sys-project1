import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/question/question_model/question_data_model.dart';
part 'quiz_data_model.g.dart';

@JsonSerializable()
class QuizDataModel {
  @JsonKey(name: '_id')
  String id;
  String name;
  @JsonKey(name: 'qustions')
  List<QuestionDataModel> questions;
  int? mark;
  QuizDataModel({
    required this.name,
    required this.id,
    required this.questions,
    this.mark,
  });
  factory QuizDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuizDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuizDataModelToJson(this);
}
