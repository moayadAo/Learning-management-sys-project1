import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/question/question_model/question_data_model.dart';
part 'get_all_questions.g.dart';

@JsonSerializable()
class GetAllQuestionsModel {
  String status;
  List<QuestionDataModel> data;

  GetAllQuestionsModel({required this.data, required this.status});

  factory GetAllQuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllQuestionsModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllQuestionsModelToJson(this);
}
