import 'package:json_annotation/json_annotation.dart';
part 'article_data_model.g.dart';

@JsonSerializable()
class ArticleDataModel {
  @JsonKey(name: '_id')
  String id;
  int order;
  String title;
  @JsonKey(name: 'path_file')
  String pathFile;
  String author;
  String category;
  DateTime? createdAt;

  ArticleDataModel(
      {required this.id,
      required this.order,
      required this.author,
      required this.category,
      required this.pathFile,
      required this.title,
      this.createdAt});

  factory ArticleDataModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleDataModelToJson(this);
}
