// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllQuestions _$GetAllQuestionsFromJson(Map<String, dynamic> json) =>
    GetAllQuestions(
      data: (json['data'] as List<dynamic>)
          .map((e) => QuestionDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetAllQuestionsToJson(GetAllQuestions instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
