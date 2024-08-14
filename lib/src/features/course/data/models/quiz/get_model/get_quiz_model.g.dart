// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuizModel _$GetQuizModelFromJson(Map<String, dynamic> json) => GetQuizModel(
      data: QuizDataModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetQuizModelToJson(GetQuizModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
