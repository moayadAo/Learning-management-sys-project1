// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_response_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetResponseCourseModel _$GetResponseCourseModelFromJson(
        Map<String, dynamic> json) =>
    GetResponseCourseModel(
      status: json['status'] as String,
      data: CourseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetResponseCourseModelToJson(
        GetResponseCourseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CourseData _$CourseDataFromJson(Map<String, dynamic> json) => CourseData(
      course: CourseDataModel.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CourseDataToJson(CourseData instance) =>
    <String, dynamic>{
      'course': instance.course,
    };
