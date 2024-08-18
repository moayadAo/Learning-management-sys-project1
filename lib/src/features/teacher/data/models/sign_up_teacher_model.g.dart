// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpTeacherModel _$SignUpTeacherModelFromJson(Map<String, dynamic> json) =>
    SignUpTeacherModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpTeacherModelToJson(SignUpTeacherModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      credentialId: Data._credentialIdFromJson(json['credentialId']),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      image: json['image'] as String?,
      cV: json['cV'] as String?,
      status: json['status'] as String?,
      wallet: (json['wallet'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      summery: json['summery'] as String?,
      token: json['token'] as String?,
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) => SocialMediaAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'credentialId': Data._credentialIdToJson(instance.credentialId),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
      'cV': instance.cV,
      'status': instance.status,
      'wallet': instance.wallet,
      'subject': instance.subject,
      'summery': instance.summery,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'token': instance.token,
    };

SocialMediaAccounts _$SocialMediaAccountsFromJson(Map<String, dynamic> json) =>
    SocialMediaAccounts(
      faceBook: json['faceBook'] as String?,
      instagram: json['instagram'] as String?,
    );

Map<String, dynamic> _$SocialMediaAccountsToJson(
        SocialMediaAccounts instance) =>
    <String, dynamic>{
      'faceBook': instance.faceBook,
      'instagram': instance.instagram,
    };
