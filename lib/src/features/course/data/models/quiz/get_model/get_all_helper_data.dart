import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';

part 'get_all_helper_data.g.dart';

@JsonSerializable()
class GetAllHelperData {
  @JsonKey(name: '_id')
  String courseId;

  List<QuizDataModel> quiz;

  GetAllHelperData({required this.quiz, required this.courseId});

  // Factory method for JSON deserialization
  factory GetAllHelperData.fromJson(Map<String, dynamic> json) =>
      _$GetAllHelperDataFromJson(json);

  // Method for JSON serialization
  Map<String, dynamic> toJson() => _$GetAllHelperDataToJson(this);
}
