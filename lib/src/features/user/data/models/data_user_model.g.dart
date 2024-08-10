// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataUserModel _$DataUserModelFromJson(Map<String, dynamic> json) =>
    DataUserModel(
      id: json['id'] as String,
      credentialId: DataUserModel._credentialIdFromJson(json['credentialId']),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      wallet: (json['wallet'] as num).toDouble(),
      finishedCourses: (json['finishedCourses'] as List<dynamic>?)
          ?.map((e) => CoursesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      enrolledCourses: (json['enrolledCourses'] as List<dynamic>?)
          ?.map((e) => CoursesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wishlist: (json['wishlist'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      progress: (json['progress'] as List<dynamic>?)
          ?.map((e) => ProgressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DataUserModelToJson(DataUserModel instance) =>
    <String, dynamic>{
      'credentialId': DataUserModel._credentialIdToJson(instance.credentialId),
      'wallet': instance.wallet,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'finishedCourses': instance.finishedCourses,
      'enrolledCourses': instance.enrolledCourses,
      'wishlist': instance.wishlist,
      'progress': instance.progress,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'id': instance.id,
    };
