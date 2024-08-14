import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:learning_system/src/features/video/cubit/video_state.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(InitialVideoState());
  double totalSizeInMB =0.0;
  late FlickManager flickManager;

  displayVideo() {
    emit(LoadingVideoState());
    try {
      flickManager = FlickManager(
          videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(
            "https://mazwai.com/videvo_files/video/free/2015-11/small_watermarked/9th-may_preview.webm"),
      ));
      emit(SuccessVideoState());
    } catch (e) {
      emit(ErrorVideoState());
    }
  }

//for upload list of videos
  Future<List<File>?> pickMultipleVideos() async {
emit(LoadingUploadVideoState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );
    if (result != null) {
      List<File> list = result.paths.map((path) => File(path!)).toList();
      // Calculate the total size
      int totalSizeInBytes = list.fold(0, (sum, file) => sum + file.lengthSync());
      double num =(totalSizeInBytes / (1024 * 1024)) ;
      double num2 =num*100;
      int num3 = num2.round();
       totalSizeInMB =num3/100;
      print("____________________________________________________________________________________________________________________Total Size: $totalSizeInMB MB");
      emit(SuccessUploadVideoState());
      return list;
    }else{
      emit(ErrorUploadVideoState());
    return null;
  }}

}









/*  void pickAndUploadMultipleVideos() async {
    List<File>? videoFiles = await pickMultipleVideos();
    if (videoFiles != null && videoFiles.isNotEmpty) {
      await uploadMultipleVideos(videoFiles);
    } else {
      print("No videos selected.");
    }
  }*/

/*
  Future<void> uploadMultipleVideos(List<File> videoFiles) async {
    Dio dio = Dio();

    List<MultipartFile> videoList = [];

    for (File videoFile in videoFiles) {
      String fileName = videoFile.path.split('/').last;
      videoList.add(await MultipartFile.fromFile(videoFile.path, filename: fileName));
    }

    FormData formData = FormData.fromMap({
      "videos": videoList,
    });

    try {
      Response response = await dio.post(
        "https://your-server-endpoint.com/upload", // Replace with your server's upload URL
        data: formData,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      print("Videos uploaded: ${response.statusCode}");
    } catch (e) {
      print("Upload failed: $e");
    }
  }
*/
