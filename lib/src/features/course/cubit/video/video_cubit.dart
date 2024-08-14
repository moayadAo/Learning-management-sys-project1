import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_file_to_api.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/cubit/video/video_states.dart';
import 'package:learning_system/src/features/course/data/models/video/get_model/get_all_video_course.dart';
import 'package:learning_system/src/features/course/data/models/video/get_model/get_video_model.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';

class VideoCubit extends Cubit<VideoStates> {
  ApiConsumer api;
  VideoCubit({required this.api}) : super(InitialVideoState());
  VideoDataModel? videoData;
  List<VideoDataModel> videoList = [];

  selectVideo() {
    emit(SelectdVideoState());
  }

  createVideo({
    required String name,
    required int duration,
    String? description,
    required File video,
  }) async {
    try {
      emit(CreateVideoLoadingState());
      final response = await api.post(AppUrl.createVideo,
          data: {
            ApiKey.videoName: name,
            ApiKey.videoDuration: duration,
            ApiKey.videoDescription: description ?? '',
            ApiKey.videoPathFile: await uploadVideoToApi(video),
          },
          isFormData: true);

      ///remove comment if u want Video ID
      // String videoId = GetVideoModel.fromJson(response).data.id;

      emit(CreateVideoSuccessState());
    } on ServerException catch (e) {
      emit(CreateVideoFailureState(message: e.errorModel.message!));
    }
  }

  getAllCourseVideo({required String courseId}) async {
    try {
      emit(GetAllVideoLoadingState());
      final response =
          await api.getApi(AppUrl.getAllCourseVideo(courseId: courseId));
      videoList = GetAllVideoCourse.fromJson(response).data;
      emit(GetAllVideoSuccessState());
    } on ServerException catch (e) {
      emit(GetAllVideoFailureState(message: e.errorModel.message!));
    }
  }

  getVideoApi({required String videoId}) async {
    try {
      emit(GetVideoLoadingState());
      final reponse =
          await api.getApi(AppUrl.getUpdateDeleteVideo(videoId: videoId));
      videoData = GetVideoModel.fromJson(reponse).data;
      emit(GetVideoSuccessState());
    } on ServerException catch (e) {
      emit(GetVideoFailureState(message: e.errorModel.message!));
    }
  }

  deleteVideoApi({required String videoId}) async {
    try {
      emit(DeleteVideoLoadingState());
      final reponse =
          await api.delete(AppUrl.getUpdateDeleteVideo(videoId: videoId));
      emit(DeleteVideoSuccessState());
    } on ServerException catch (e) {
      emit(DeleteVideoFailureState(message: e.errorModel.message!));
    }
  }

  updateVideo({
    required String videoId,
    String? name,
    int? duration,
    String? description,
    File? video,
  }) async {
    final Map<String, dynamic> data = {};
    if (name != null) data[ApiKey.videoName] = name;
    if (duration != null) data[ApiKey.videoDuration] = duration;
    if (description != null) data[ApiKey.videoDescription] = description;
    if (video != null) data[ApiKey.videoPathFile] = uploadVideoToApi(video);

    try {
      emit(UpdateVideoLoadingState());
      final response = await api.patch(
          AppUrl.getUpdateDeleteVideo(videoId: videoId),
          data: data,
          isFormData: true);
      emit(UpdateVideoSuccessState());
    } on ServerException catch (e) {
      emit(UpdateVideoFailureState(message: e.errorModel.message!));
    }
  }
}
/// note Video was a XFile and the methode upload to video also take XFile i convert to FIle 