import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_system/src/features/quiz/cubit/create_quiz/create_quiz_state.dart';

class CreateQuizCubit extends Cubit<CreateQuizState>{
  CreateQuizCubit() : super (InitialCreateQuizState());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController titleQuiz =TextEditingController();
  TextEditingController firstQuestionQuiz =TextEditingController();
  TextEditingController secondQuestionQuiz =TextEditingController();
  TextEditingController thirdQuestionQuiz =TextEditingController();
  TextEditingController fourQuestionQuiz =TextEditingController();
  TextEditingController correctAnswer =TextEditingController();


  void sendInfoQuiz (){
    emit(LoadingCreateQuizState());
    //put api info
    if(true){
      emit(SuccessCreateQuizState());
    }else{
      emit(ErrorCreateQuizState());
    }

  }

}
