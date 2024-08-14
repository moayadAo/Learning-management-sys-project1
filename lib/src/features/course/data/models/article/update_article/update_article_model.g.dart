// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateArticleModel _$UpdateArticleModelFromJson(Map<String, dynamic> json) =>
    UpdateArticleModel(
      status: json['status'] as String,
      result: ArticleDataModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateArticleModelToJson(UpdateArticleModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
