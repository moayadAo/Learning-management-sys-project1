abstract class QuizState {}

class InitialQuizState extends QuizState {}

class SelectAnswerState extends QuizState {}

class SubmitAnswerSuccess extends QuizState {}

class SubmitAnswerWrong extends QuizState {}

class FinishQuizState extends QuizState {}

class NextQuizState extends QuizState {}

class CreateLoadingQuizState extends QuizState {}

class CreateSuccessQuizState extends QuizState {}

class CreateFailureQuizState extends QuizState {
  String massage;
  CreateFailureQuizState({required this.massage});
}

class UpdateLoadingQuizState extends QuizState {}

class UpdateSuccessQuizState extends QuizState {}

class UpdateFailureQuizState extends QuizState {
  String massage;
  UpdateFailureQuizState({required this.massage});
}

class GetLoadingQuizState extends QuizState {}

class GetSuccessQuizState extends QuizState {}

class GetFailureQuizState extends QuizState {
  String massage;
  GetFailureQuizState({required this.massage});
}

class GetAllLoadingQuizState extends QuizState {}

class GetAllSuccessQuizState extends QuizState {}

class GetAllFailureQuizState extends QuizState {
  String massage;
  GetAllFailureQuizState({required this.massage});
}

class DeleteLoadingQuizState extends QuizState {}

class DeleteSuccessQuizState extends QuizState {}

class DeleteFailureQuizState extends QuizState {
  String massage;
  DeleteFailureQuizState({required this.massage});
}
