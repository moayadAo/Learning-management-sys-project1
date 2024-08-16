// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuestionModel _$GetQuestionModelFromJson(Map<String, dynamic> json) =>
    GetQuestionModel(
      data: QuestionDataModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetQuestionModelToJson(GetQuestionModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
