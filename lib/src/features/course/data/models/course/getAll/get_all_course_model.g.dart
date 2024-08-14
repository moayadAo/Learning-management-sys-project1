// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCourseModel _$GetAllCourseModelFromJson(Map<String, dynamic> json) =>
    GetAllCourseModel(
      status: json['status'] as String,
      data: DataAllCourseModel.fromJson(json['data'] as Map<String, dynamic>),
      result: (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$GetAllCourseModelToJson(GetAllCourseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
      'data': instance.data,
    };
