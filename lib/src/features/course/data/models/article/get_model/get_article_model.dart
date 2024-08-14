import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
part 'get_article_model.g.dart';

@JsonSerializable()
class GetArticleModel {
  String status;
  ArticleDataModel data;
  GetArticleModel({
    required this.status,
    required this.data,
  });

  factory GetArticleModel.fromJson(Map<String, dynamic> json) =>
      _$GetArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetArticleModelToJson(this);
}
