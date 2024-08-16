// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptTeacherModel _$AcceptTeacherModelFromJson(Map<String, dynamic> json) =>
    AcceptTeacherModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AcceptTeacherModelToJson(AcceptTeacherModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      cost: (json['cost'] as num?)?.toInt(),
      credentialId: json['credentialId'] as String?,
      name: json['name'] as String?,
      wallet: (json['wallet'] as num?)?.toInt(),
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) => SocialMediaAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      teachers: (json['teachers'] as List<dynamic>?)
          ?.map((e) => Teachers.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'cost': instance.cost,
      'credentialId': instance.credentialId,
      'name': instance.name,
      'wallet': instance.wallet,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'teachers': instance.teachers,
      'id': instance.id,
    };

SocialMediaAccounts _$SocialMediaAccountsFromJson(Map<String, dynamic> json) =>
    SocialMediaAccounts(
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$SocialMediaAccountsToJson(
        SocialMediaAccounts instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'instagram': instance.instagram,
    };

Teachers _$TeachersFromJson(Map<String, dynamic> json) => Teachers(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      teacherId: json['teacherId'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$TeachersToJson(Teachers instance) => <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'teacherId': instance.teacherId,
      'sId': instance.sId,
    };
