import 'package:bloc/bloc.dart';
import 'package:learning_system/src/feautres/auth/welcome/cubit/welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeFirstPage());
  void getPage({required int pageNum}) {
    if (pageNum == 0) {
      emit(WelcomeFirstPage());
    } else if (pageNum == 1) {
      emit(WelcomeSecondPage());
    } else if (pageNum == 2) {
      emit(WelcomeLastPage());
    }
  }
}
