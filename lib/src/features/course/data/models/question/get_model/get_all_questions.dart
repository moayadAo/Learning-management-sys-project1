import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/question/question_model/question_data_model.dart';
part 'get_all_questions.g.dart';

@JsonSerializable()
class GetAllQuestions {
  String status;
  List<QuestionDataModel> data;

  GetAllQuestions({required this.data, required this.status});

  factory GetAllQuestions.fromJson(Map<String, dynamic> json) =>
      _$GetAllQuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllQuestionsToJson(this);
}
