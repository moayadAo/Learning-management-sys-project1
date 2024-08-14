import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_file_to_api.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/cubit/article/article_states.dart';
import 'package:learning_system/src/features/course/data/models/article/articel_model/article_data_model.dart';
import 'package:learning_system/src/features/course/data/models/article/get_model/get_all_article_model.dart';
import 'package:learning_system/src/features/course/data/models/article/get_model/get_article_model.dart';
import 'package:learning_system/src/features/course/data/models/article/update_article/update_article_model.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ApiConsumer api;
  ArticleCubit({required this.api}) : super(InitialArticleState());

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
      //String articleId = GetArticleModel.fromJson(response).data.id;
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
      ArticleDataModel article = GetArticleModel.fromJson(response).data;
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
}
