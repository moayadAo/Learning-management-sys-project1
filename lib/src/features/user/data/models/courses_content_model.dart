import 'package:json_annotation/json_annotation.dart';

part 'courses_content_model.g.dart';

@JsonSerializable()
class CoursesModel {
  @JsonKey(name: "video")
  List<dynamic>? video;
  @JsonKey(name: "article")
  List<dynamic>? article;
  @JsonKey(name: "quiz")
  List<dynamic>? quiz;
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "rate")
  double rate;
  @JsonKey(name: "cost")
  int cost;
  @JsonKey(name: "duration")
  int duration;
  @JsonKey(name: "language")
  List<String> language;
  @JsonKey(name: "Education_Level")
  String educationLevel;
  @JsonKey(name: "Teacher_ID")
  int teacherId;
  @JsonKey(name: "Categories")
  String categories;
  @JsonKey(name: "plan")
  List<String>? plan;
  @JsonKey(name: "subtitle")
  String subtitle;
  @JsonKey(name: "managment")
  String managment;
  @JsonKey(name: "what_you_will_learn")
  String whatYouWillLearn;
  @JsonKey(name: "Image")
  String image;
  @JsonKey(name: "__v")
  int v;

  CoursesModel({
    required this.video,
    required this.article,
    required this.quiz,
    required this.id,
    required this.name,
    required this.rate,
    required this.cost,
    required this.duration,
    required this.language,
    required this.educationLevel,
    required this.teacherId,
    required this.categories,
    required this.plan,
    required this.subtitle,
    required this.managment,
    required this.whatYouWillLearn,
    required this.image,
    required this.v,
  });


  factory CoursesModel.fromJson(Map<String,dynamic>json)=>_$CoursesModelFromJson(json);

  Map<String,dynamic> toJson()=>_$CoursesModelToJson(this);
}
