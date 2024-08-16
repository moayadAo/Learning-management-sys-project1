abstract class FileViewState {}

class FileViewInitial extends FileViewState {}

class FileViewLoading extends FileViewState {}

class FileViewLoaded extends FileViewState {}

class FileViewError extends FileViewState {
  final String message;
  FileViewError(this.message);
}