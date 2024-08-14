import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';
part 'update_video_model.g.dart';

@JsonSerializable()
class UpdateVideoModel {
  String status;
  VideoDataModel result;
  UpdateVideoModel({
    required this.status,
    required this.result,
  });

  factory UpdateVideoModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateVideoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateVideoModelToJson(this);
}
