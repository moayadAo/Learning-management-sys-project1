import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';
import 'package:learning_system/src/features/course/data/models/rate/rate_model.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';
part 'course_data_model.g.dart';

@JsonSerializable()
class CourseDataModel {
  @JsonKey(name: 'Teacher_ID')
  List<String> teachersId;
  @JsonKey(name: '_id')
  String id;
  String name;
  double? rate;
  double? cost;
  int duration;
  List<String> language;
  @JsonKey(name: 'Education_Level')
  String? EducationLevel; // must be enum
  String? Categories;
  List<String>? plan;
  List<VideoDataModel>? video;
  List<ArticleDataModel>? article;
  List<QuizDataModel>? quiz;
  @JsonKey(name: 'instituteId')
  String? institutionId;
  @JsonKey(name: 'what_you_will_learn')
  String? whatYouWillLearn;
  @JsonKey(name: 'Image')
  String? courseImage;
  List<RateModel>? ratings;

  CourseDataModel({
    required this.id,
    required this.name,
    this.rate,
    this.ratings,
    this.cost,
    required this.duration,
    required this.language,
    this.EducationLevel,
    required this.teachersId,
    this.video,
    this.Categories,
    this.article,
    this.quiz,
    this.institutionId,
    this.whatYouWillLearn,
    this.courseImage,
    this.plan,
  });

  factory CourseDataModel.fromJson(Map<String, dynamic> json) =>
      _$CourseDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDataModelToJson(this);
}
