// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      httpStatusCode: (json['httpStatusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      stackTrace: json['stackTrace'] as String?,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'httpStatusCode': instance.httpStatusCode,
      'message': instance.message,
      'stackTrace': instance.stackTrace,
    };
