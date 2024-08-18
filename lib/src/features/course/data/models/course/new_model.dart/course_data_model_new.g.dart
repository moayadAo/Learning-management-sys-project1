// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_data_model_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDataModelNewForGetAllApi _$CourseDataModelNewForGetAllApiFromJson(
        Map<String, dynamic> json) =>
    CourseDataModelNewForGetAllApi(
      id: json['_id'] as String,
      name: json['name'] as String,
      rate: (json['rate'] as num?)?.toDouble(),
      cost: (json['cost'] as num?)?.toDouble(),
      teacher: (json['Teacher_ID'] as List<dynamic>?)
          ?.map((e) => TeacherIdModelNew.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['Categories'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CourseDataModelNewForGetAllApiToJson(
        CourseDataModelNewForGetAllApi instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'cost': instance.cost,
      'Teacher_ID': instance.teacher,
      'Categories': instance.category,
      'status': instance.status,
    };
