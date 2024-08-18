
abstract class UserStates {}

class UserInitial extends UserStates {}

class SignInSuccess extends UserStates {}

class UploadProfilePic extends UserStates {}

class SignInLoading extends UserStates {}

final class SignInFailure extends UserStates {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends UserStates {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpLoading extends UserStates {}

final class SignUpFailure extends UserStates {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class GetUserSuccess extends UserStates {}

final class GetUserLoading extends UserStates {}

final class GetUserFailure extends UserStates {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
