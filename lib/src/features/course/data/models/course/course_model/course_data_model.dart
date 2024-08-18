import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
import 'package:learning_system/src/features/course/data/models/course/new_model.dart/get_all/teacher_id_model_new.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';
import 'package:learning_system/src/features/course/data/models/rate/rate_model.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';

import '../new_model.dart/get/instiute_mode.dart';
part 'course_data_model.g.dart';

@JsonSerializable()
class CourseDataModel {
  @JsonKey(name: 'Teacher_ID')
  List<TeacherIdModelNew> teachersId;
  @JsonKey(name: '_id')
  String id;
  String status;
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
  InstiutIdModel? institutionId;
  @JsonKey(name: 'what_you_will_learn')
  String? whatYouWillLearn;
  @JsonKey(name: 'image')
  String? courseImage;
  List<RateModel>? ratings;

  CourseDataModel({
    required this.id,
    required this.status,
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
