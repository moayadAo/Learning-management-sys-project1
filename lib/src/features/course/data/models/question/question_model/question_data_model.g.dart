// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDataModel _$QuestionDataModelFromJson(Map<String, dynamic> json) =>
    QuestionDataModel(
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      correctAnswer: json['true_answer'] as String,
      questionTitle: json['question'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$QuestionDataModelToJson(QuestionDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.questionTitle,
      'answers': instance.answers,
      'true_answer': instance.correctAnswer,
    };
