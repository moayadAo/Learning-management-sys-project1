import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
part 'update_article_model.g.dart';

@JsonSerializable()
class UpdateArticleModel {
  String status;
  ArticleDataModel result;
  UpdateArticleModel({
    required this.status,
    required this.result,
  });

  factory UpdateArticleModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateArticleModelToJson(this);
}
