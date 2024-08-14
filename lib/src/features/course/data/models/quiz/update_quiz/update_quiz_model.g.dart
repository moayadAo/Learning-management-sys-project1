// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateQuizModel _$UpdateQuizModelFromJson(Map<String, dynamic> json) =>
    UpdateQuizModel(
      status: json['status'] as String,
      result: QuizDataModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateQuizModelToJson(UpdateQuizModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
