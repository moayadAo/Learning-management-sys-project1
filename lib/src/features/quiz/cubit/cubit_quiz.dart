import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/data/models/quiz_model/quiz_model.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz_state.dart';

class QuizCubit extends Cubit<QuizState>{
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  bool isColor = false;

  QuizCubit():super(InitialQuizState());

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = QuestionInfo.questions[questionIndex];
    emit(SelectAnswerState());
  }
void isSubmit(BuildContext context){
  if (selectedAnswerIndex == QuestionInfo.questions[questionIndex].correctAnswerIndex) {
    score++;
    context.read<AnswerCubit>().correctAnswer();
  }else {
    context.read<AnswerCubit>().wrongAnswer();
  }
  goToNextQuestion();
}



  void goToNextQuestion() {
    if(questionIndex < QuestionInfo.questions.length - 1){
      emit(NextQuizState());

    }else{
      emit(FinishQuizState());
    }

  }
reset(BuildContext context){
    emit(InitialQuizState());
    selectedAnswerIndex = null;
    questionIndex++;
    context.read<AnswerCubit>().reset() ;

}

}