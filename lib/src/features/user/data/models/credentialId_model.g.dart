// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentialId_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialIdModel _$CredentialIdModelFromJson(Map<String, dynamic> json) =>
    CredentialIdModel(
      id: json['_id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CredentialIdModelToJson(CredentialIdModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
