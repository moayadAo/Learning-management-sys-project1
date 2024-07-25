// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressModel _$ProgressModelFromJson(Map<String, dynamic> json) =>
    ProgressModel(
      courseId: json['courseID'] as String,
      done: (json['done'] as List<dynamic>?)?.map((e) => e as String).toList(),
      doneModel: (json['doneModel'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProgressModelToJson(ProgressModel instance) =>
    <String, dynamic>{
      'courseID': instance.courseId,
      'done': instance.done,
      'doneModel': instance.doneModel,
    };
