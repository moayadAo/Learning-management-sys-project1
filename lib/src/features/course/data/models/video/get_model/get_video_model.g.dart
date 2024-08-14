// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVideoModel _$GetVideoModelFromJson(Map<String, dynamic> json) =>
    GetVideoModel(
      status: json['status'] as String,
      data: VideoDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetVideoModelToJson(GetVideoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
