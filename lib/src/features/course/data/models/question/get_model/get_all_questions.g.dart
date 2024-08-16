// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllQuestionsModel _$GetAllQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    GetAllQuestionsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => QuestionDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetAllQuestionsModelToJson(
        GetAllQuestionsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
