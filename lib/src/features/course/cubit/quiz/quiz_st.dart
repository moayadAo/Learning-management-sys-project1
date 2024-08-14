abstract class QuizSt {}

class InitialQuizState extends QuizSt {}

class CreateLoadingQuizState extends QuizSt {}

class CreateSuccessQuizState extends QuizSt {}

class CreateFailureQuizState extends QuizSt {
  String massage;
  CreateFailureQuizState({required this.massage});
}

class UpdateLoadingQuizState extends QuizSt {}

class UpdateSuccessQuizState extends QuizSt {}

class UpdateFailureQuizState extends QuizSt {
  String massage;
  UpdateFailureQuizState({required this.massage});
}

class GetLoadingQuizState extends QuizSt {}

class GetSuccessQuizState extends QuizSt {}

class GetFailureQuizState extends QuizSt {
  String massage;
  GetFailureQuizState({required this.massage});
}

class GetAllLoadingQuizState extends QuizSt {}

class GetAllSuccessQuizState extends QuizSt {}

class GetAllFailureQuizState extends QuizSt {
  String massage;
  GetAllFailureQuizState({required this.massage});
}

class DeleteLoadingQuizState extends QuizSt {}

class DeleteSuccessQuizState extends QuizSt {}

class DeleteFailureQuizState extends QuizSt {
  String massage;
  DeleteFailureQuizState({required this.massage});
}
