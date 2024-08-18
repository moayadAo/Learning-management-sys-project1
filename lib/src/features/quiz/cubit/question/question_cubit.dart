import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/data/models/question/get_model/get_all_questions.dart';
import 'package:learning_system/src/features/course/data/models/question/get_model/get_question_model.dart';
import 'package:learning_system/src/features/course/data/models/question/question_model/question_data_model.dart';
import 'package:learning_system/src/features/quiz/cubit/question/question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  ApiConsumer api;
  List<QuestionDataModel>? questions;
  String? id;

  TextEditingController firstQuestionQuiz = TextEditingController();
  TextEditingController secondQuestionQuiz = TextEditingController();
  TextEditingController thirdQuestionQuiz = TextEditingController();
  TextEditingController fourQuestionQuiz = TextEditingController();
  TextEditingController questionTitle = TextEditingController();
  TextEditingController correctAnswer = TextEditingController();
  QuestionCubit({required this.api}) : super(InitialQuestionState());

  List<String> getAnswerList() {
    log('in convert list');
    return [
      firstQuestionQuiz.text,
      secondQuestionQuiz.text,
      thirdQuestionQuiz.text,
      fourQuestionQuiz.text,
    ];
  }

  changeShowQuestionFormState(bool show) {
    if (show) {
      emit(showQuestionState());
    } else {
      emit(InitialQuestionState());
    }
  }

  createQuestion(
      {required String question,
      required List<String> answers,
      required String trueAnswer}) async {
    try {
      emit(CreateQuestionLoadingState());
      final response = await api.post(AppUrl.createQuestion, data: {
        ApiKey.questionTitle: question,
        ApiKey.questionAnswers: answers,
        ApiKey.questionCorrectAnswer: trueAnswer,
      });
// Parse the JSON string into a Map
      // Map<String, dynamic> jsonMap = jsonDecode(response);
      id = GetQuestionModel.fromJson(response).data.id;
      // // Access the _id value
      // id = jsonMap['data']['_id'];
      emit(CreateQuestionSuccessState());
    } on ServerException catch (e) {
      emit(CreateQuestionFailureState(message: e.errorModel.message!));
    }
  }

  getQuestion({required String id}) async {
    try {
      emit(GetQuestionLoadingState());
      final response =
          await api.getApi(AppUrl.getUpdateDeleteQuestion(quesId: id));
      QuestionDataModel question = GetQuestionModel.fromJson(response).data;
      emit(GetQuestionSuccessState());
    } on ServerException catch (e) {
      emit(GetQuestionFailureState(message: e.errorModel.message!));
    }
  }

  getAllQuestions({required String quizId}) async {
    try {
      emit(GetAllQuestionLoadingState());
      final response = await api.getApi(AppUrl.getAllQuestion(quizId: quizId));
      questions = GetAllQuestionsModel.fromJson(response).data;
      emit(GetAllQuestionSuccessState());
    } on ServerException catch (e) {
      emit(GetAllQuestionFailureState(message: e.errorModel.message!));
    }
  }

  resetQuestion() {
    firstQuestionQuiz = TextEditingController();
    secondQuestionQuiz = TextEditingController();
    thirdQuestionQuiz = TextEditingController();
    fourQuestionQuiz = TextEditingController();
    questionTitle = TextEditingController();
    correctAnswer = TextEditingController();
    id = '';
    emit(InitialQuestionState());
  }
}
