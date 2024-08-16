// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDataModel _$QuizDataModelFromJson(Map<String, dynamic> json) =>
    QuizDataModel(
      order: (json['order'] as num).toInt(),
      name: json['name'] as String,
      id: json['_id'] as String,
      questions: (json['qustions'] as List<dynamic>)
          .map((e) => QuestionDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mark: (json['mark'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizDataModelToJson(QuizDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'order': instance.order,
      'name': instance.name,
      'qustions': instance.questions,
      'mark': instance.mark,
    };
