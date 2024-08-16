// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_institute_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInstituteProfileModel _$GetInstituteProfileModelFromJson(
        Map<String, dynamic> json) =>
    GetInstituteProfileModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInstituteProfileModelToJson(
        GetInstituteProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      credentialId: json['credentialId'] == null
          ? null
          : CredentialId.fromJson(json['credentialId'] as Map<String, dynamic>),
      name: json['name'] as String?,
      wallet: (json['wallet'] as num?)?.toInt(),
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cost: (json['cost'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'credentialId': instance.credentialId,
      'name': instance.name,
      'wallet': instance.wallet,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'cost': instance.cost,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };

CredentialId _$CredentialIdFromJson(Map<String, dynamic> json) => CredentialId(
      sId: json['sId'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: (json['iV'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CredentialIdToJson(CredentialId instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
