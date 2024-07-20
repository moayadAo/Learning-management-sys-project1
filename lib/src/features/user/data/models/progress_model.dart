import 'package:json_annotation/json_annotation.dart';

part 'progress_model.g.dart';
@JsonSerializable()
class ProgressModel{
  @JsonKey(name: "courseID")
  String courseId;
  @JsonKey(name: "done")
  List<String>? done;
  @JsonKey(name: "doneModel")
  List<String>? doneModel;

  ProgressModel({
    required this.courseId,
    required this.done,
    required this.doneModel,
  });

  factory ProgressModel.fromJson(Map<String, dynamic> json) =>_$ProgressModelFromJson(json);
  Map<String,dynamic> toJson ()=>_$ProgressModelToJson(this);
}