import 'package:json_annotation/json_annotation.dart';
part 'video_data_model.g.dart';

@JsonSerializable()
class VideoDataModel {
  @JsonKey(name: '_id')
  String id;
  int order;
  String name;
  String? description;
  int duration;
  @JsonKey(name: 'name_video')
  String pathVideo;
  VideoDataModel({
    required this.id,
    required this.order,
    required this.name,
    required this.duration,
    required this.pathVideo,
    this.description,
  });

  factory VideoDataModel.fromJson(Map<String, dynamic> json) =>
      _$VideoDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$VideoDataModelToJson(this);
}
