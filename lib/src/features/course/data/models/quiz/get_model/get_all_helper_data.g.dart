// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_helper_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllHelperData _$GetAllHelperDataFromJson(Map<String, dynamic> json) =>
    GetAllHelperData(
      quiz: (json['quiz'] as List<dynamic>)
          .map((e) => QuizDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      courseId: json['_id'] as String,
    );

Map<String, dynamic> _$GetAllHelperDataToJson(GetAllHelperData instance) =>
    <String, dynamic>{
      '_id': instance.courseId,
      'quiz': instance.quiz,
    };
