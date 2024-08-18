import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/data/models/quiz_model/quiz_model.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/course/data/models/quiz/get_model/all_get_quiz_model.dart';
import 'package:learning_system/src/features/course/data/models/quiz/get_model/get_quiz_model.dart';
import 'package:learning_system/src/features/course/data/models/quiz/post_quiz/post_model_quiz.dart';
import 'package:learning_system/src/features/course/data/models/quiz/quiz_model/quiz_data_model.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_state.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  ApiConsumer api;
  List<String> questionIds = [];
  String? id;
  QuizDataModel? quiz;

  TextEditingController titleQuiz = TextEditingController();
  TextEditingController quizOrder = TextEditingController();

  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  bool isColor = false;

  QuizCubit({required this.api}) : super(InitialQuizState());

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    // final question = QuestionInfo.questions[questionIndex];
    final question = quiz!.questions[questionIndex];
    emit(SelectAnswerState());
  }

  void isSubmit(BuildContext context) {
    final int indexOfCorrectAnswer = quiz!.questions[questionIndex].answers
        .indexOf(quiz!.questions[questionIndex].correctAnswer);
    if (selectedAnswerIndex == indexOfCorrectAnswer) {
      score++;
      context.read<AnswerCubit>().correctAnswer();
    } else {
      context.read<AnswerCubit>().wrongAnswer();
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (questionIndex < quiz!.questions.length - 1) {
      emit(NextQuizState());
    } else {
      emit(FinishQuizState());
    }
  }

  reset(BuildContext context) {
    emit(InitialQuizState());
    selectedAnswerIndex = null;
    questionIndex++;
    context.read<AnswerCubit>().reset();
  }

  createQuiz(
      {required String name,
      required List<String> questionId,
      required int order,
      int? mark}) async {
    try {
      emit(CreateLoadingQuizState());
      final response = await api.post(AppUrl.createQuizUrl, data: {
        ApiKey.quizName: name,
        'order': order,
        ApiKey.quizQustions: questionId,
        ApiKey.quizMark: mark ?? 100
      });
      id = QuizModel.fromJson(response).data.id;

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
      quiz = GetQuizModel.fromJson(response).data;
      emit(GetSuccessQuizState());
    } on ServerException catch (e) {
      emit(GetFailureQuizState(massage: e.errorModel.message!));
    }
  }

  getAllQuizApi({required String id}) async {
    try {
      emit(GetAllLoadingQuizState());
      final response = await api.getApi(AppUrl.getAllQuiz(courseId: id));
      List<QuizDataModel> listQuiz =
          AllGetQuizModel.fromJson(response).data.quiz;
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

  resetQuizAfterUpdate() {
    titleQuiz = TextEditingController();
    quizOrder = TextEditingController();
    questionIds = [];
    id = '';
    emit(InitialQuizState());
  }
}
