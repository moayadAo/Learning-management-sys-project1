import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_file_to_api.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/cubit/video/video_states.dart';
import 'package:learning_system/src/features/course/data/models/video/get_model/get_all_video_course.dart';
import 'package:learning_system/src/features/course/data/models/video/get_model/get_video_model.dart';
import 'package:learning_system/src/features/course/data/models/video/video_model/video_data_model.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<VideoStates> {
  TextEditingController videoName = TextEditingController();
  TextEditingController videoDescription = TextEditingController();
  TextEditingController videoDuration = TextEditingController();
  TextEditingController videoOrder = TextEditingController();
  ApiConsumer api;
  late FlickManager flickManager;
  String? id;

  VideoCubit({required this.api}) : super(InitialVideoState());
  VideoDataModel? videoData;
  List<VideoDataModel> videoList = [];

  Future<File?> pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  Future<File?> pickAndUploadVideo() async {
    emit(LoadVideoLoadingState());
    File? video = await pickVideo();
    if (video != null) {
      emit(LoadVideoSuccessState());
      return video;
    } else {
      emit(LoadVideoFailureState());
      return null;
    }
  }

  displayVideo(String? url) async {
    emit(LoadingVideoState());
    try {
      flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse('${AppUrl.videoUrlUpload}$url' ??
            "https://mazwai.com/videvo_files/video/free/2015-11/small_watermarked/9th-may_preview.webm"),
      ));
      emit(SuccessVideoState());
    } on ServerException catch (e) {
      //should
      emit(ErrorVideoState(message: e.errorModel.message!));
    }
  }

  createVideo({
    required String name,
    required int duration,
    required int order,
    String? description,
    required File video,
  }) async {
    try {
      emit(CreateVideoLoadingState());
      final response = await api.post(AppUrl.createVideo,
          data: {
            ApiKey.videoName: name,
            ApiKey.videoDuration: duration,
            ApiKey.order: order,
            ApiKey.videoDescription: description ?? '',
            ApiKey.videoPathFile: await uploadVideoToApi(video),
          },
          isFormData: true);

      ///remove comment if u want Video ID
      // String videoId = GetVideoModel.fromJson(response).data.id;
      id = GetVideoModel.fromJson(response).data.id;

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

  initForUpdatePage({required String id}) async {
    await getVideoApi(videoId: id);
    videoName.text = videoData!.name;
    videoDescription.text = videoData!.description ?? '';
    videoDuration.text = '${videoData!.duration}';
    emit(InitialVideoState());
  }

  resetVideoAfterCreate() {
    videoDuration = TextEditingController();
    videoDescription = TextEditingController();
    videoName = TextEditingController();
    id = '';
    emit(InitialVideoState());
  }

  /// abd pick video
//   Future<List<File>?> pickMultipleVideos() async {
// emit(LoadingUploadVideoState());
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//       allowMultiple: true,
//     );
//     if (result != null) {
//       List<File> list = result.paths.map((path) => File(path!)).toList();
//       // Calculate the total size
//       int totalSizeInBytes = list.fold(0, (sum, file) => sum + file.lengthSync());
//       double num =(totalSizeInBytes / (1024 * 1024)) ;
//       double num2 =num*100;
//       int num3 = num2.round();
//        totalSizeInMB =num3/100;
//       print("____________________________________________________________________________________________________________________Total Size: $totalSizeInMB MB");
//       emit(SuccessUploadVideoState());
//       return list;
//     }else{
//       emit(ErrorUploadVideoState());
//     return null;
//   }}
}

/// note Video was a XFile and the methode upload to video also take XFile i convert to FIle
