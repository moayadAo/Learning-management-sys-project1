// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllArticleModel _$GetAllArticleModelFromJson(Map<String, dynamic> json) =>
    GetAllArticleModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => ArticleDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GetAllArticleModelToJson(GetAllArticleModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
