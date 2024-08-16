// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scholarship_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScholarshipRequestModel _$ScholarshipRequestModelFromJson(
        Map<String, dynamic> json) =>
    ScholarshipRequestModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScholarshipRequestModelToJson(
        ScholarshipRequestModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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
      'userToInstituteByGrant': instance.userToInstituteByGrant,
      'sId': instance.sId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };

UserToInstituteByGrant _$UserToInstituteByGrantFromJson(
        Map<String, dynamic> json) =>
    UserToInstituteByGrant(
      instituteId: json['instituteId'] as String?,
      scholarshipId: json['scholarshipId'] as String?,
      userId: (json['userId'] as List<dynamic>?)
          ?.map((e) => UserId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToInstituteByGrantToJson(
        UserToInstituteByGrant instance) =>
    <String, dynamic>{
      'instituteId': instance.instituteId,
      'scholarshipId': instance.scholarshipId,
      'userId': instance.userId,
    };

UserId _$UserIdFromJson(Map<String, dynamic> json) => UserId(
      credentialId: json['credentialId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      birthDate: json['birthDate'] as String?,
      wallet: (json['wallet'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserIdToJson(UserId instance) => <String, dynamic>{
      'credentialId': instance.credentialId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate,
      'wallet': instance.wallet,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };
