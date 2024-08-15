// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTeacherModel _$GetAllTeacherModelFromJson(Map<String, dynamic> json) =>
    GetAllTeacherModel(
      json['status'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => GetInfoTeacherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllTeacherModelToJson(GetAllTeacherModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
