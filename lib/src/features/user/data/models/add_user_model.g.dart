// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserModel _$AddUserModelFromJson(Map<String, dynamic> json) => AddUserModel(
      status: json['status'] as String,
      data: DataUserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddUserModelToJson(AddUserModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
