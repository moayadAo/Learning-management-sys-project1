import 'package:bloc/bloc.dart';

class RatingCubit extends Cubit<double> {
  RatingCubit() : super(0.0);

  void updateRating(double rating) {
    emit(rating);
  }
}
