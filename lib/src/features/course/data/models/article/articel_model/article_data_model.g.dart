// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDataModel _$ArticleDataModelFromJson(Map<String, dynamic> json) =>
    ArticleDataModel(
      id: json['_id'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
      pathFile: json['path_file'] as String,
      title: json['title'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ArticleDataModelToJson(ArticleDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'path_file': instance.pathFile,
      'author': instance.author,
      'category': instance.category,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
