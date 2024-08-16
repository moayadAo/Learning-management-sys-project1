// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_teacher_to_institute_requists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTeacherToInstituteRequistsModel _$GetTeacherToInstituteRequistsModelFromJson(
        Map<String, dynamic> json) =>
    GetTeacherToInstituteRequistsModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTeacherToInstituteRequistsModelToJson(
        GetTeacherToInstituteRequistsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      teacherToInstitute: json['teacherToInstitute'] == null
          ? null
          : TeacherToInstitute.fromJson(
              json['teacherToInstitute'] as Map<String, dynamic>),
      userToInstituteByGrant: json['userToInstituteByGrant'] == null
          ? null
          : UserToInstituteByGrant.fromJson(
              json['userToInstituteByGrant'] as Map<String, dynamic>),
      sId: json['sId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: (json['iV'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'teacherToInstitute': instance.teacherToInstitute,
      'userToInstituteByGrant': instance.userToInstituteByGrant,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

TeacherToInstitute _$TeacherToInstituteFromJson(Map<String, dynamic> json) =>
    TeacherToInstitute(
      teacherId: json['teacherId'] == null
          ? null
          : TeacherId.fromJson(json['teacherId'] as Map<String, dynamic>),
      instituteId: json['instituteId'] == null
          ? null
          : InstituteId.fromJson(json['instituteId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeacherToInstituteToJson(TeacherToInstitute instance) =>
    <String, dynamic>{
      'teacherId': instance.teacherId,
      'instituteId': instance.instituteId,
    };

TeacherId _$TeacherIdFromJson(Map<String, dynamic> json) => TeacherId(
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
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TeacherIdToJson(TeacherId instance) => <String, dynamic>{
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

InstituteId _$InstituteIdFromJson(Map<String, dynamic> json) => InstituteId(
      credentialId: json['credentialId'] as String?,
      name: json['name'] as String?,
      wallet: (json['wallet'] as num?)?.toInt(),
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cost: (json['cost'] as num?)?.toInt(),
      paidStudent: (json['paidStudent'] as List<dynamic>?)
          ?.map((e) => PaidStudent.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$InstituteIdToJson(InstituteId instance) =>
    <String, dynamic>{
      'credentialId': instance.credentialId,
      'name': instance.name,
      'wallet': instance.wallet,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'cost': instance.cost,
      'paidStudent': instance.paidStudent,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };

PaidStudent _$PaidStudentFromJson(Map<String, dynamic> json) => PaidStudent(
      sId: json['sId'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$PaidStudentToJson(PaidStudent instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'endDate': instance.endDate,
    };

UserToInstituteByGrant _$UserToInstituteByGrantFromJson(
        Map<String, dynamic> json) =>
    UserToInstituteByGrant();

Map<String, dynamic> _$UserToInstituteByGrantToJson(
        UserToInstituteByGrant instance) =>
    <String, dynamic>{};
