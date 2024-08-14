abstract class VideoStates {}

class InitialVideoState extends VideoStates {}

class SelectdVideoState extends VideoStates {}

class CreateVideoLoadingState extends VideoStates {}

class CreateVideoSuccessState extends VideoStates {}

class CreateVideoFailureState extends VideoStates {
  String message;
  CreateVideoFailureState({required this.message});
}

class LoadingVideoState extends VideoStates {}

class SuccessVideoState extends VideoStates {}

class ErrorVideoState extends VideoStates {
  String message;
  ErrorVideoState({required this.message});
}

class GetAllVideoLoadingState extends VideoStates {}

class GetAllVideoSuccessState extends VideoStates {}

class GetAllVideoFailureState extends VideoStates {
  String message;
  GetAllVideoFailureState({required this.message});
}

class GetVideoLoadingState extends VideoStates {}

class GetVideoSuccessState extends VideoStates {}

class GetVideoFailureState extends VideoStates {
  String message;
  GetVideoFailureState({required this.message});
}

class DeleteVideoLoadingState extends VideoStates {}

class DeleteVideoSuccessState extends VideoStates {}

class DeleteVideoFailureState extends VideoStates {
  String message;
  DeleteVideoFailureState({required this.message});
}

class UpdateVideoLoadingState extends VideoStates {}

class UpdateVideoSuccessState extends VideoStates {}

class UpdateVideoFailureState extends VideoStates {
  String message;
  UpdateVideoFailureState({required this.message});
}
