// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_teachers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyTeacherModel _$GetMyTeacherModelFromJson(Map<String, dynamic> json) =>
    GetMyTeacherModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetMyTeacherModelToJson(GetMyTeacherModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      teachers: (json['teachers'] as List<dynamic>?)
          ?.map((e) => Teachers.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'teachers': instance.teachers,
      'id': instance.id,
    };

Teachers _$TeachersFromJson(Map<String, dynamic> json) => Teachers(
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      teacherId: json['teacherId'] == null
          ? null
          : TeacherId.fromJson(json['teacherId'] as Map<String, dynamic>),
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$TeachersToJson(Teachers instance) => <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'teacherId': instance.teacherId,
      'sId': instance.sId,
    };

TeacherId _$TeacherIdFromJson(Map<String, dynamic> json) => TeacherId(
      sId: json['sId'] as String?,
      credentialId: json['credentialId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      wallet: (json['wallet'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      summery: json['summery'] as String?,
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) => SocialMediaAccounts.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: (json['iV'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TeacherIdToJson(TeacherId instance) => <String, dynamic>{
      'sId': instance.sId,
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
      'iV': instance.iV,
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
