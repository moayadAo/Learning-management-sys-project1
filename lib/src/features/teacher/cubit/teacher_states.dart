abstract class TeacherStates {}

class InitialTeacherState extends TeacherStates {}

class LoadingTeacherState extends TeacherStates {}

class LoadedTeacherState extends TeacherStates {}

class ErrorTeacherState extends TeacherStates {}

class CvLoadingTeacherState extends TeacherStates {}

class CvLoadedTeacherState extends TeacherStates {}

class CvErrorTeacherState extends TeacherStates {
  final String message;
  CvErrorTeacherState(this.message);
}
