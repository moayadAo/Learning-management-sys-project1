abstract class ArticleState {}

class InitialArticleState extends ArticleState {}

class CreateArticleLoadingState extends ArticleState {}

class CreateArticleSuccessState extends ArticleState {}

class CreateArticleFailureState extends ArticleState {
  String message;
  CreateArticleFailureState({required this.message});
}

class GetArticleLoadingState extends ArticleState {}

class GetArticleSuccessState extends ArticleState {}

class GetArticleFailureState extends ArticleState {
  String message;
  GetArticleFailureState({required this.message});
}

class GetAllArticleLoadingState extends ArticleState {}

class GetAllArticleSuccessState extends ArticleState {}

class GetAllArticleFailureState extends ArticleState {
  String message;
  GetAllArticleFailureState({required this.message});
}

class DeleteArticleLoadingState extends ArticleState {}

class DeleteArticleSuccessState extends ArticleState {}

class DeleteArticleFailureState extends ArticleState {
  String message;
  DeleteArticleFailureState({required this.message});
}

class LoadArticleLoadingState extends ArticleState {}

class LoadArticleSuccessState extends ArticleState {}

class LoadArticleFailureState extends ArticleState {}

class UpdateArticleLoadingState extends ArticleState {}

class UpdateArticleSuccessState extends ArticleState {}

class UpdateArticleFailureState extends ArticleState {
  String message;
  UpdateArticleFailureState({required this.message});
}
