// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageTeacherModel _$MessageTeacherModelFromJson(Map<String, dynamic> json) =>
    MessageTeacherModel(
      json['instituteName'] as String,
      json['theMessage'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$MessageTeacherModelToJson(
        MessageTeacherModel instance) =>
    <String, dynamic>{
      'instituteName': instance.instituteName,
      'theMessage': instance.theMessage,
      'id': instance.id,
    };
