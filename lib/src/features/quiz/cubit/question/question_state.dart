abstract class QuestionState {}

class InitialQuestionState extends QuestionState {}

class CreateQuestionLoadingState extends QuestionState {}

class CreateQuestionSuccessState extends QuestionState {}

class CreateQuestionFailureState extends QuestionState {
  String message;
  CreateQuestionFailureState({required this.message});
}

class GetQuestionLoadingState extends QuestionState {}

class GetQuestionSuccessState extends QuestionState {}

class GetQuestionFailureState extends QuestionState {
  String message;
  GetQuestionFailureState({required this.message});
}

class showQuestionState extends QuestionState {}

class GetAllQuestionLoadingState extends QuestionState {}

class GetAllQuestionSuccessState extends QuestionState {}

class GetAllQuestionFailureState extends QuestionState {
  String message;
  GetAllQuestionFailureState({required this.message});
}
