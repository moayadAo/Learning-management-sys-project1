import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_file_to_api.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/cubit/article/article_states.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
import 'package:learning_system/src/features/course/data/models/article/get_model/get_all_article_model.dart';
import 'package:learning_system/src/features/course/data/models/article/get_model/get_article_model.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ApiConsumer api;
  String? id;
  ArticleDataModel? article;

  TextEditingController articleTitle = TextEditingController();

  TextEditingController articleAuthor = TextEditingController();

  TextEditingController articleCategory = TextEditingController();

  ArticleCubit({required this.api}) : super(InitialArticleState());

  Future<File?> pickDocument() async {
    emit(LoadArticleLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Specify allowed file extensions
    );

    if (result != null) {
      emit(LoadArticleSuccessState());
      return File(result.files.single.path!);
    } else {
      emit(LoadArticleFailureState());
      return null; // User canceled the picker
    }
  }

  craeteArticleApi({
    required String title,
    required File pathFile,
    String? author,
    String? category,
  }) async {
    try {
      emit(CreateArticleLoadingState());
      final response =
          await api.post(AppUrl.createArticle, isFormData: true, data: {
        ApiKey.articleTitle: title,
        ApiKey.articlePathFile: await uploadDocumentToApi(pathFile),
        ApiKey.articleAuthor: author ?? '',
        ApiKey.articleCategory: category ?? '',
      });

      ///
      // String articleId = GetArticleModel.fromJson(response).data.id;
      id = GetArticleModel.fromJson(response).data.id;
      emit(CreateArticleSuccessState());
    } on ServerException catch (e) {
      emit(CreateArticleFailureState(message: e.errorModel.message!));
    }
  }

  getArticleApi({required String articleId}) async {
    try {
      emit(GetArticleLoadingState());
      final response =
          await api.getApi(AppUrl.getUpdateDeleteArticle(articleId: articleId));
      article = GetArticleModel.fromJson(response).data;
      emit(GetArticleSuccessState());
    } on ServerException catch (e) {
      emit(GetArticleFailureState(message: e.errorModel.message!));
    }
  }

  deleteArticleApi({required String articleId}) async {
    try {
      emit(DeleteArticleLoadingState());
      final response =
          await api.delete(AppUrl.getUpdateDeleteArticle(articleId: articleId));
      emit(DeleteArticleSuccessState());
    } on ServerException catch (e) {
      emit(DeleteArticleFailureState(message: e.errorModel.message!));
    }
  }

  getAllArticleApi({required String courseId}) async {
    try {
      emit(GetAllArticleLoadingState());
      final response =
          await api.getApi(AppUrl.getAllArticle(courseId: courseId));
      List<ArticleDataModel> articles =
          GetAllArticleModel.fromJson(response).data;
      emit(GetAllArticleSuccessState());
    } on ServerException catch (e) {
      emit(GetAllArticleFailureState(message: e.errorModel.message!));
    }
  }

  updateArticleApi({
    required String articleId,
    String? title,
    File? pathFile,
    String? author,
    String? category,
  }) async {
    final Map<String, dynamic> data = {};
    if (title != null) data[ApiKey.articleTitle] = title;
    if (author != null) data[ApiKey.articleAuthor] = author;
    if (category != null) data[ApiKey.articleCategory] = category;
    if (pathFile != null) {
      data[ApiKey.articlePathFile] = await uploadDocumentToApi(pathFile);
    }
    try {
      emit(UpdateArticleLoadingState());
      final rseponse = await api.patch(
          AppUrl.getUpdateDeleteArticle(articleId: articleId),
          data: data,
          isFormData: true);
      emit(UpdateArticleSuccessState());
    } on ServerException catch (e) {
      emit(UpdateArticleFailureState(message: e.errorModel.message!));
    }
  }

  initForUpdatePage({required String id}) async {
    await getArticleApi(articleId: id);
    articleTitle.text = article!.title;
    articleAuthor.text = article!.author;
    articleCategory.text = article!.category;
    emit(InitialArticleState());
  }
}
