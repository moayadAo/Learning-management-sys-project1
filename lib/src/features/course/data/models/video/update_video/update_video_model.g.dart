// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateVideoModel _$UpdateVideoModelFromJson(Map<String, dynamic> json) =>
    UpdateVideoModel(
      status: json['status'] as String,
      result: VideoDataModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateVideoModelToJson(UpdateVideoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
