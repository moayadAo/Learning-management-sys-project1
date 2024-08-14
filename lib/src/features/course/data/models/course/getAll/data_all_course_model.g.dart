// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_all_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataAllCourseModel _$DataAllCourseModelFromJson(Map<String, dynamic> json) =>
    DataAllCourseModel(
      courses: (json['courses'] as List<dynamic>)
          .map((e) => CourseDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataAllCourseModelToJson(DataAllCourseModel instance) =>
    <String, dynamic>{
      'courses': instance.courses,
    };
