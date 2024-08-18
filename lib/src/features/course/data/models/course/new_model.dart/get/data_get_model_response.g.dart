// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_get_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataGetModelResponse _$DataGetModelResponseFromJson(
        Map<String, dynamic> json) =>
    DataGetModelResponse(
      basic: CourseDataModel.fromJson(json['basic'] as Map<String, dynamic>),
      order: (json['order'] as List<dynamic>)
          .map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataGetModelResponseToJson(
        DataGetModelResponse instance) =>
    <String, dynamic>{
      'basic': instance.basic,
      'order': instance.order,
    };
