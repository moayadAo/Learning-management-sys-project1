// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_institute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllInstituteModel _$GetAllInstituteModelFromJson(
        Map<String, dynamic> json) =>
    GetAllInstituteModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllInstituteModelToJson(
        GetAllInstituteModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      scholarship: (json['scholarship'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
      studentScholarship: (json['studentScholarship'] as List<dynamic>?)
          ?.map((e) => StudentScholarship.fromJson(e as Map<String, dynamic>))
          .toList(),
      myStudent: (json['myStudent'] as List<dynamic>?)
          ?.map((e) => MyStudent.fromJson(e as Map<String, dynamic>))
          .toList(),
      paidStudent: (json['paidStudent'] as List<dynamic>?)
          ?.map((e) => PaidStudent.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'scholarship': instance.scholarship,
      'cost': instance.cost,
      'credentialId': instance.credentialId,
      'name': instance.name,
      'wallet': instance.wallet,
      'socialMediaAccounts': instance.socialMediaAccounts,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'teachers': instance.teachers,
      'studentScholarship': instance.studentScholarship,
      'myStudent': instance.myStudent,
      'paidStudent': instance.paidStudent,
      'id': instance.id,
      'image': instance.image,
    };

SocialMediaAccounts _$SocialMediaAccountsFromJson(Map<String, dynamic> json) =>
    SocialMediaAccounts(
      facebook: json['facebook'] as String?,
      instgram: json['instgram'] as String?,
    );

Map<String, dynamic> _$SocialMediaAccountsToJson(
        SocialMediaAccounts instance) =>
    <String, dynamic>{
      'facebook': instance.facebook,
      'instgram': instance.instgram,
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

StudentScholarship _$StudentScholarshipFromJson(Map<String, dynamic> json) =>
    StudentScholarship(
      studentId: json['studentId'] as String?,
      endDate: json['endDate'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$StudentScholarshipToJson(StudentScholarship instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'endDate': instance.endDate,
      'sId': instance.sId,
    };

MyStudent _$MyStudentFromJson(Map<String, dynamic> json) => MyStudent(
      studentId: json['studentId'] as String?,
      startDate: json['startDate'] as String?,
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$MyStudentToJson(MyStudent instance) => <String, dynamic>{
      'studentId': instance.studentId,
      'startDate': instance.startDate,
      'sId': instance.sId,
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
