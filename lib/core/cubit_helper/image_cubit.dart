import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/cubit_helper/image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageIniitalState());
  load() {
    emit(ImageLoadState());
  }

  win() {
    emit(ImageSuccessState());
  }
}
