import 'package:json_annotation/json_annotation.dart';
part 'question_data_model.g.dart';

@JsonSerializable()
class QuestionDataModel {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'question')
  String questionTitle;
  List<String> answers;
  @JsonKey(name: 'true_answer')
  String correctAnswer;

  QuestionDataModel({
    required this.answers,
    required this.correctAnswer,
    required this.questionTitle,
    required this.id,
  });
  factory QuestionDataModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionDataModelToJson(this);
}
