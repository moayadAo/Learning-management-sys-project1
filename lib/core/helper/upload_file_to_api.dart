import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

Future uploadImageToApi(XFile image) async {
  return await MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}

Future<MultipartFile> uploadVideoToApi(File video) async {
  return await MultipartFile.fromFile(
    video.path,
    filename: video.path.split('/').last,
  );
}

Future<MultipartFile> uploadDocumentToApi(File document) async {
  return await MultipartFile.fromFile(
    document.path,
    filename:
        document.path.split('/').last, // Extracts the file name from the path
  );
}
