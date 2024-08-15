// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_info_teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInfoTeacherModel _$GetInfoTeacherModelFromJson(Map<String, dynamic> json) =>
    GetInfoTeacherModel(
      credentialId: json['credentialId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      image: json['image'] as String,
      status: json['status'] as String,
      wallet: (json['wallet'] as num).toInt(),
      subject: json['subject'] as String,
      summery: json['summery'] as String,
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) =>
              SocialMediaAccountsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetInfoTeacherModelToJson(
        GetInfoTeacherModel instance) =>
    <String, dynamic>{
      'credentialId': instance.credentialId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
      'status': instance.status,
      'wallet': instance.wallet,
      'subject': instance.subject,
      'summery': instance.summery,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };
