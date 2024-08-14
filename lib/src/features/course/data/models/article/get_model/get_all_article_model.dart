import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
part 'get_all_article_model.g.dart';

@JsonSerializable()
class GetAllArticleModel {
  String status;
  List<ArticleDataModel> data;

  GetAllArticleModel({
    required this.data,
    required this.status,
  });

  factory GetAllArticleModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllArticleModelToJson(this);
}
