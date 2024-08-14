import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'add_course_state.dart';

class AddCourseCubit extends Cubit<AddCourseState> {
  AddCourseCubit() : super(AddCourseInitial()) ;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController courseId =TextEditingController();
  TextEditingController nameOfCourse =TextEditingController();
  TextEditingController description =TextEditingController();



  void sendInfoQuiz (){
   /* emit(AddCourseLoading());
    //put api info
    if(true){
      emit(AddCourseSuccess());
    }else{
      emit(AddCourseError());
    }*/


  }
}
