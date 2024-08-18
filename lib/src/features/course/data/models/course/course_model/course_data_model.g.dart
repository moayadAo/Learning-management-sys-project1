// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDataModel _$CourseDataModelFromJson(Map<String, dynamic> json) =>
    CourseDataModel(
      id: json['_id'] as String,
      status: json['status'] as String,
      name: json['name'] as String,
      rate: (json['rate'] as num?)?.toDouble(),
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => RateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cost: (json['cost'] as num?)?.toDouble(),
      duration: (json['duration'] as num).toInt(),
      language:
          (json['language'] as List<dynamic>).map((e) => e as String).toList(),
      EducationLevel: json['Education_Level'] as String?,
      teachersId: (json['Teacher_ID'] as List<dynamic>)
          .map((e) => TeacherIdModelNew.fromJson(e as Map<String, dynamic>))
          .toList(),
      video: (json['video'] as List<dynamic>?)
          ?.map((e) => VideoDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      Categories: json['Categories'] as String?,
      article: (json['article'] as List<dynamic>?)
          ?.map((e) => ArticleDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      quiz: (json['quiz'] as List<dynamic>?)
          ?.map((e) => QuizDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      institutionId: json['instituteId'] == null
          ? null
          : InstiutIdModel.fromJson(
              json['instituteId'] as Map<String, dynamic>),
      whatYouWillLearn: json['what_you_will_learn'] as String?,
      courseImage: json['image'] as String?,
      plan: (json['plan'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CourseDataModelToJson(CourseDataModel instance) =>
    <String, dynamic>{
      'Teacher_ID': instance.teachersId,
      '_id': instance.id,
      'status': instance.status,
      'name': instance.name,
      'rate': instance.rate,
      'cost': instance.cost,
      'duration': instance.duration,
      'language': instance.language,
      'Education_Level': instance.EducationLevel,
      'Categories': instance.Categories,
      'plan': instance.plan,
      'video': instance.video,
      'article': instance.article,
      'quiz': instance.quiz,
      'instituteId': instance.institutionId,
      'what_you_will_learn': instance.whatYouWillLearn,
      'image': instance.courseImage,
      'ratings': instance.ratings,
    };
