import 'package:json_annotation/json_annotation.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';
part 'get_all_video_course.g.dart';

@JsonSerializable()
class GetAllVideoCourse {
  String status;
  List<VideoDataModel> data;

  GetAllVideoCourse({
    required this.data,
    required this.status,
  });

  factory GetAllVideoCourse.fromJson(Map<String, dynamic> json) =>
      _$GetAllVideoCourseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAllVideoCourseToJson(this);
}
