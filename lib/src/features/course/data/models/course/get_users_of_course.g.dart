// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_of_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersOfCourse _$GetUsersOfCourseFromJson(Map<String, dynamic> json) =>
    GetUsersOfCourse(
      status: json['status'] as String,
      data: CourseDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUsersOfCourseToJson(GetUsersOfCourse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
