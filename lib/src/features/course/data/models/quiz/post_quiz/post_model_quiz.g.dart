// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model_quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      status: json['status'] as String,
      data: QuizDataHelper.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

QuizDataHelper _$QuizDataHelperFromJson(Map<String, dynamic> json) =>
    QuizDataHelper(
      name: json['name'] as String,
      qustions:
          (json['qustions'] as List<dynamic>).map((e) => e as String).toList(),
      mark: (json['mark'] as num).toInt(),
      id: json['_id'] as String,
      version: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$QuizDataHelperToJson(QuizDataHelper instance) =>
    <String, dynamic>{
      'name': instance.name,
      'qustions': instance.qustions,
      'mark': instance.mark,
      '_id': instance.id,
      '__v': instance.version,
    };
