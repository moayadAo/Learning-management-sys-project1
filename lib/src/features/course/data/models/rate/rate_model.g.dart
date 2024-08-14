// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateModel _$RateModelFromJson(Map<String, dynamic> json) => RateModel(
      userId: json['userId'] as String,
      comment: json['comment'] as String,
      rate: (json['rate'] as num).toDouble(),
      rateId: json['_id'] as String,
    );

Map<String, dynamic> _$RateModelToJson(RateModel instance) => <String, dynamic>{
      'rate': instance.rate,
      'userId': instance.userId,
      'comment': instance.comment,
      '_id': instance.rateId,
    };
