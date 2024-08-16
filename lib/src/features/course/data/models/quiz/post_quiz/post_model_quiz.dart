import 'package:json_annotation/json_annotation.dart';

part 'post_model_quiz.g.dart';

@JsonSerializable()
class QuizModel {
  final String status;
  final QuizDataHelper data;

  QuizModel({
    required this.status,
    required this.data,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}

@JsonSerializable()
class QuizDataHelper {
  final String name;
  final List<String> qustions;
  final int mark;
  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: '__v')
  final int version;

  QuizDataHelper({
    required this.name,
    required this.qustions,
    required this.mark,
    required this.id,
    required this.version,
  });

  factory QuizDataHelper.fromJson(Map<String, dynamic> json) =>
      _$QuizDataHelperFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDataHelperToJson(this);
}
