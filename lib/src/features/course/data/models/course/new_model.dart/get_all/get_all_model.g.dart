// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllModelCourseNew _$GetAllModelCourseNewFromJson(
        Map<String, dynamic> json) =>
    GetAllModelCourseNew(
      data: DataHelperModeCourse.fromJson(json['data'] as Map<String, dynamic>),
      result: (json['result'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetAllModelCourseNewToJson(
        GetAllModelCourseNew instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
      'data': instance.data,
    };
