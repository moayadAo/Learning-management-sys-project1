// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesModel _$CoursesModelFromJson(Map<String, dynamic> json) => CoursesModel(
      video: json['video'] as List<dynamic>?,
      article: json['article'] as List<dynamic>?,
      quiz: json['quiz'] as List<dynamic>?,
      id: json['_id'] as String,
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
      cost: (json['cost'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      language:
          (json['language'] as List<dynamic>).map((e) => e as String).toList(),
      educationLevel: json['Education_Level'] as String,
      teacherId: (json['Teacher_ID'] as num).toInt(),
      categories: json['Categories'] as String,
      plan: (json['plan'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subtitle: json['subtitle'] as String,
      managment: json['managment'] as String,
      whatYouWillLearn: json['what_you_will_learn'] as String,
      image: json['Image'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$CoursesModelToJson(CoursesModel instance) =>
    <String, dynamic>{
      'video': instance.video,
      'article': instance.article,
      'quiz': instance.quiz,
      '_id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'cost': instance.cost,
      'duration': instance.duration,
      'language': instance.language,
      'Education_Level': instance.educationLevel,
      'Teacher_ID': instance.teacherId,
      'Categories': instance.categories,
      'plan': instance.plan,
      'subtitle': instance.subtitle,
      'managment': instance.managment,
      'what_you_will_learn': instance.whatYouWillLearn,
      'Image': instance.image,
      '__v': instance.v,
    };
