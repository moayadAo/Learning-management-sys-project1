import 'package:bloc/bloc.dart';
import 'package:learning_system/src/features/article/cubit/pdf_state.dart';

class FileViewCubit extends Cubit<FileViewState> {
  FileViewCubit() : super(FileViewInitial());

   String pdfUrl ="";

  void loadPdf(String url) async {
    pdfUrl = url ;
    emit(FileViewLoading());
    try {
      // Replace with actual PDF loading logic
      await Future.delayed(const Duration(seconds: 1));
      emit(FileViewLoaded());
    } catch (e) {
      emit(FileViewError(e.toString()));
    }
  }
}
