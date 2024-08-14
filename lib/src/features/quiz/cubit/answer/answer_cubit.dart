import 'package:bloc/bloc.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_state.dart';

class AnswerCubit extends Cubit<AnswerState>{
  AnswerCubit():super(InitialAnswerState());

  correctAnswer(){
    emit(CorrectAnswerState());
  }
  wrongAnswer(){
    emit(WrongAnswerState());
  }
  reset(){
    emit(InitialAnswerState()); 
  }
}