import 'package:bloc/bloc.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/cubit/follow_course_state.dart';

class FollowCourseCubit extends Cubit<FollowCourseState>{
  FollowCourseCubit() : super (InitialFollowCourseState());



  ///for test
  int? selectedIndex;


  void isSelectVideo(int index) {
    selectedIndex = index;
    emit(IsSelectedFollowCourseState());
  }


}