// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_get_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllGetQuizModel _$AllGetQuizModelFromJson(Map<String, dynamic> json) =>
    AllGetQuizModel(
      data: GetAllHelperData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String,
    );

Map<String, dynamic> _$AllGetQuizModelToJson(AllGetQuizModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
