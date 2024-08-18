// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_helper_mode_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHelperModeCourse _$DataHelperModeCourseFromJson(
        Map<String, dynamic> json) =>
    DataHelperModeCourse(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseDataModelNewForGetAllApi.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHelperModeCourseToJson(
        DataHelperModeCourse instance) =>
    <String, dynamic>{
      'courses': instance.courses,
    };
