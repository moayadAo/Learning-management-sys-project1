part of 'institute_cubit.dart';

sealed class InstituteState {}

final class InstituteInitial extends InstituteState {}

class AddInstituteLoadingState extends InstituteState {}

class AddInstituteSuccessState extends InstituteState {}

class AddInstituteFailureState extends InstituteState {
  String message;
  AddInstituteFailureState({required this.message});
}

class LoginInstituteLoadingState extends InstituteState {}

class LoginInstituteSuccessState extends InstituteState {}

class LoginInstituteFailureState extends InstituteState {
  String message;
  LoginInstituteFailureState({required this.message});
}

class RejectTeacherInstituteLoadingState extends InstituteState {}

class RejectTeacherInstituteSuccessState extends InstituteState {}

class RejectTeacherInstituteFailureState extends InstituteState {
  String message;
  RejectTeacherInstituteFailureState({required this.message});
}

class AddMyStudentInstituteLoadingState extends InstituteState {}

class AddMyStudentInstituteSuccessState extends InstituteState {}

class AddMyStudentInstituteFailureState extends InstituteState {
  String message;
  AddMyStudentInstituteFailureState({required this.message});
}

class AcceptScholarshipInstituteLoadingState extends InstituteState {}

class AcceptScholarshipInstituteSuccessState extends InstituteState {}

class AcceptScholarshipInstituteFailureState extends InstituteState {
  String message;
  AcceptScholarshipInstituteFailureState({required this.message});
}

class UpdateInstituteLoadingState extends InstituteState {}

class UpdateInstituteSuccessState extends InstituteState {}

class UpdateInstituteFailureState extends InstituteState {
  String message;
  UpdateInstituteFailureState({required this.message});
}

class GetAllInstituteLoadingState extends InstituteState {}

class GetAllInstituteSuccessState extends InstituteState {}

class GetAllInstituteFailureState extends InstituteState {
  String message;
  GetAllInstituteFailureState({required this.message});
}

class GetInstituteProfileLoadingState extends InstituteState {}

class GetInstituteProfileSuccessState extends InstituteState {}

class GetInstituteProfileFailureState extends InstituteState {
  String message;
  GetInstituteProfileFailureState({required this.message});
}

class GetTeacherToInstituteRequistsLoadingState extends InstituteState {}

class GetTeacherToInstituteRequistsSuccessState extends InstituteState {}

class GetTeacherToInstituteRequistsFailureState extends InstituteState {
  String message;
  GetTeacherToInstituteRequistsFailureState({required this.message});
}

class AcceptTeacherInstituteLoadingState extends InstituteState {}

class AcceptTeacherInstituteSuccessState extends InstituteState {}

class AcceptTeacherInstituteFailureState extends InstituteState {
  String message;
  AcceptTeacherInstituteFailureState({required this.message});
}

class GetMyTeachersInstituteLoadingState extends InstituteState {}

class GetMyTeachersInstituteSuccessState extends InstituteState {}

class GetMyTeachersInstituteFailureState extends InstituteState {
  String message;
  GetMyTeachersInstituteFailureState({required this.message});
}

class ScholarshipRequestsInstituteLoadingState extends InstituteState {}

class ScholarshipRequestsInstituteSuccessState extends InstituteState {}

class ScholarshipRequestsInstituteFailureState extends InstituteState {
  String message;
  ScholarshipRequestsInstituteFailureState({required this.message});
}

class RemoveScholarshipStudentInstituteLoadingState extends InstituteState {}

class RemoveScholarshipStudentInstituteSuccessState extends InstituteState {}

class RemoveScholarshipStudentInstituteFailureState extends InstituteState {
  String message;
  RemoveScholarshipStudentInstituteFailureState({required this.message});
}

class DeleteMyStudentInstituteLoadingState extends InstituteState {}

class DeleteMyStudentInstituteSuccessState extends InstituteState {}

class DeleteMyStudentInstituteFailureState extends InstituteState {
  String message;
  DeleteMyStudentInstituteFailureState({required this.message});
}

class RemovePaidStudentInstituteLoadingState extends InstituteState {}

class RemovePaidStudentInstituteSuccessState extends InstituteState {}

class RemovePaidStudentInstituteFailureState extends InstituteState {
  String message;
  RemovePaidStudentInstituteFailureState({required this.message});
}

class LoadInstituteLoadingState extends InstituteState {}

class LoadInstituteSuccessState extends InstituteState {}

class LoadInstituteFailureState extends InstituteState {}
