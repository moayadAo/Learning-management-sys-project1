// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDataModel _$VideoDataModelFromJson(Map<String, dynamic> json) =>
    VideoDataModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      duration: (json['duration'] as num).toInt(),
      pathVideo: json['name_video'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$VideoDataModelToJson(VideoDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'name_video': instance.pathVideo,
    };
