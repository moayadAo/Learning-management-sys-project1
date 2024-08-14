// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetArticleModel _$GetArticleModelFromJson(Map<String, dynamic> json) =>
    GetArticleModel(
      status: json['status'] as String,
      data: ArticleDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetArticleModelToJson(GetArticleModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
