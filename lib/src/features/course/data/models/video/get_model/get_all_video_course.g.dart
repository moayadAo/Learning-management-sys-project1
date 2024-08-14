// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_video_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllVideoCourse _$GetAllVideoCourseFromJson(Map<String, dynamic> json) =>
    GetAllVideoCourse(
      data: (json['data'] as List<dynamic>)
          .map((e) => VideoDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetAllVideoCourseToJson(GetAllVideoCourse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
