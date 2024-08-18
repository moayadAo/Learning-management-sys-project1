abstract class TeacherStates {}

class InitialTeacherState extends TeacherStates {}

class CvLoadingTeacherState extends TeacherStates {}

class CvLoadedTeacherState extends TeacherStates {}

class CvErrorTeacherState extends TeacherStates {
  final String message;
  CvErrorTeacherState(this.message);
}

class UploadTeacherProfilePicTeacherState extends TeacherStates {}

class SignUpLoading extends TeacherStates {}

class SignUpSuccess extends TeacherStates {
  final String message;
  SignUpSuccess({required this.message});
}

class SignUpFailure extends TeacherStates {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

class GetAllTeachersLoadingState extends TeacherStates {}

class GetAllTeachersSuccessState extends TeacherStates {}

class GetAllTeachersFailureState extends TeacherStates {
  final String message;
  GetAllTeachersFailureState({required this.message});
}

class GetProfileTeacherLoadingState extends TeacherStates {}

class GetProfileTeacherSuccessState extends TeacherStates {}

class GetProfileTeacherFailureState extends TeacherStates {
  final String message;
  GetProfileTeacherFailureState({required this.message});
}

class JoinInstituteTeacherLoadingState extends TeacherStates {}

class JoinInstituteTeacherSuccessState extends TeacherStates {}

class JoinInstituteTeacherFailureState extends TeacherStates {
  final String message;
  JoinInstituteTeacherFailureState({required this.message});
}

class GetMyInstituteTeacherLoadingState extends TeacherStates {}

class GetMyInstituteTeacherSuccessState extends TeacherStates {}

class GetMyInstituteTeacherFailureState extends TeacherStates {
  final String message;
  GetMyInstituteTeacherFailureState({required this.message});
}

class GetAllMessagesTeacherLoadingState extends TeacherStates {}

class GetAllMessagesTeacherSuccessState extends TeacherStates {}

class GetAllMessagesTeacherFailureState extends TeacherStates {
  final String message;
  GetAllMessagesTeacherFailureState({required this.message});
}

class GetMessageTeacherLoadingState extends TeacherStates {}

class GetMessageTeacherSuccessState extends TeacherStates {}

class GetMessageTeacherFailureState extends TeacherStates {
  final String message;
  GetMessageTeacherFailureState({required this.message});
}
