import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';
part 'get_video_model.g.dart';

@JsonSerializable()
class GetVideoModel {
  String status;
  VideoDataModel data;
  GetVideoModel({
    required this.status,
    required this.data,
  });

  factory GetVideoModel.fromJson(Map<String, dynamic> json) =>
      _$GetVideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetVideoModelToJson(this);
}
