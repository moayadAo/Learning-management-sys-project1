abstract class CourseState {}

class InitialCourseState extends CourseState {}

class CreateCourseLoadingState extends CourseState {}

class CreateCourseSuccessState extends CourseState {}

class CreateCourseFailureState extends CourseState {
  String errMessage;
  CreateCourseFailureState({required this.errMessage});
}

class GetCourseLoadingState extends CourseState {}

class GetCourseSuccessState extends CourseState {}

class GetCourseFailureState extends CourseState {
  String errMessage;
  GetCourseFailureState({required this.errMessage});
}

class GetAllCourseLoadingState extends CourseState {}

class GetAllCourseEmptyListState extends CourseState {}

class GetAllCourseSuccessState extends CourseState {}

class GetAllCourseFailureState extends CourseState {
  String errMessage;
  GetAllCourseFailureState({required this.errMessage});
}

class DeleteCourseLoadingState extends CourseState {}

class DeleteCourseSuccessState extends CourseState {
  String message;
  DeleteCourseSuccessState({required this.message});
}

class DeleteCourseFailureState extends CourseState {
  String errMessage;
  DeleteCourseFailureState({required this.errMessage});
}

class GetRatingCourseLoadingState extends CourseState {}

class GetRatingCourseSuccessState extends CourseState {}

class GetRatingCourseFailureState extends CourseState {
  String message;
  GetRatingCourseFailureState({required this.message});
}

class UpdateCourseLoadingState extends CourseState {}

class UpdateCourseSuccessState extends CourseState {}

class UpdateCourseFailureState extends CourseState {
  String message;
  UpdateCourseFailureState({required this.message});
}
/////////////////////////////////////
class IsExpanded extends CourseState {}
class IsNotExpanded extends CourseState {}


