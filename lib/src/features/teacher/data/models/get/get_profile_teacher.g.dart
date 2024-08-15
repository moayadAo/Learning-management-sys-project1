// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileTeacherModel _$GetProfileTeacherModelFromJson(
        Map<String, dynamic> json) =>
    GetProfileTeacherModel(
      credentialId: (json['credentialId'] as List<dynamic>)
          .map((e) => CredentialIdModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      image: json['image'] as String,
      cv: json['CV'] as String,
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
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageTeacherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetProfileTeacherModelToJson(
        GetProfileTeacherModel instance) =>
    <String, dynamic>{
      'credentialId': instance.credentialId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
      'CV': instance.cv,
      'status': instance.status,
      'wallet': instance.wallet,
      'subject': instance.subject,
      'summery': instance.summery,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'messages': instance.messages,
    };
