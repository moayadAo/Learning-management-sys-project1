// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_model_course_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetModelCourseNew _$GetModelCourseNewFromJson(Map<String, dynamic> json) =>
    GetModelCourseNew(
      data: DataGetModelResponse.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetModelCourseNewToJson(GetModelCourseNew instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
