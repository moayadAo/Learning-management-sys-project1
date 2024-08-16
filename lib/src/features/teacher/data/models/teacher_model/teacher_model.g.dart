// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      subject: json['subject'] as String,
      summery: json['summery'] as String,
      socialMediaAccounts: (json['socialMediaAccounts'] as List<dynamic>?)
          ?.map((e) =>
              SocialMediaAccountsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'subject': instance.subject,
      'summery': instance.summery,
      'socialMediaAccounts': instance.socialMediaAccounts,
    };
