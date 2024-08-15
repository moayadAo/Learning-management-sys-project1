import 'package:bloc/bloc.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_states.dart';

class TeacherCubit extends Cubit<TeacherStates>{
  TeacherCubit():super(InitialTeacherState());
  String cvUrl ="";
  String rule = "user";
  void loadCv(String url) async {
    cvUrl = url ;
    emit(CvLoadingTeacherState());
    try {
      // Replace with actual PDF loading logic
      await Future.delayed(Duration(seconds: 1));
      emit(CvLoadedTeacherState());
    } catch (e) {
      emit(CvErrorTeacherState(e.toString()));
    }
  }

}