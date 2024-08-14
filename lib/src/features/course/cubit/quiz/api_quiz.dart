import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/cubit/quiz/quiz_st.dart';
import 'package:learning_system/src/features/course/data/models/quiz/get_model/all_get_quiz_model.dart';
import 'package:learning_system/src/features/course/data/models/quiz/get_model/get_quiz_model.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';

class QuizCubit extends Cubit<QuizSt> {
  ApiConsumer api;
  QuizCubit({required this.api}) : super(InitialQuizState());

  createQuiz(
      {required String name,
      required List<String> questionId,
      int? mark}) async {
    try {
      emit(CreateLoadingQuizState());
      final response = await api.post(AppUrl.createQuizUrl, data: {
        ApiKey.quizName: name,
        ApiKey.quizQustions: questionId,
        ApiKey.quizMark: mark ?? 100
      });
      emit(CreateSuccessQuizState());
    } on ServerException catch (e) {
      emit(CreateFailureQuizState(massage: e.errorModel.message!));
    }
  }

  updateQuiz(
      {required String id,
      String? name,
      List<String>? questionId,
      int? mark}) async {
    final Map<String, dynamic> data = {};
    if (name != null) data[ApiKey.quizName] = name;
    if (questionId != null) data[ApiKey.quizQustions] = questionId;
    if (mark != null) data[ApiKey.quizMark] = mark;

    try {
      emit(UpdateLoadingQuizState());
      final response =
          await api.patch(AppUrl.getUpdateDeleteQuiz(quizId: id), data: data);
      emit(UpdateSuccessQuizState());
    } on ServerException catch (e) {
      emit(UpdateFailureQuizState(massage: e.errorModel.message!));
    }
  }

  getQuizApi({required String id}) async {
    try {
      emit(GetLoadingQuizState());
      final response = await api.getApi(AppUrl.getUpdateDeleteQuiz(quizId: id));
      QuizDataModel quiz = GetQuizModel.fromJson(response).data;
      emit(GetSuccessQuizState());
    } on ServerException catch (e) {
      emit(GetFailureQuizState(massage: e.errorModel.message!));
    }
  }

  getAllQuizApi({required String id}) async {
    try {
      emit(GetAllLoadingQuizState());
      final response = await api.getApi(AppUrl.getAllQuiz(courseId: id));
      List<QuizDataModel> listQuiz = AllGetQuizModel.fromJson(response).data;
      emit(GetAllSuccessQuizState());
    } on ServerException catch (e) {
      emit(GetAllFailureQuizState(massage: e.errorModel.message!));
    }
  }

  deleteQuizApi({required String id}) async {
    try {
      emit(DeleteLoadingQuizState());
      final response = await api.delete(AppUrl.getUpdateDeleteQuiz(quizId: id));
      emit(DeleteSuccessQuizState());
    } on ServerException catch (e) {
      emit(DeleteFailureQuizState(massage: e.errorModel.message!));
    }
  }
}
