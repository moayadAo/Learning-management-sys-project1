import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_item.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final List<CourseItem> allCourses;

  SearchCubit(this.allCourses) : super(SearchInitial(allCourses));

  void updateSearch(String searchQuery) {
    final filteredCourses = allCourses.where((course) {
      return course.nameOfCourse.toLowerCase().contains(searchQuery.toLowerCase()) ||
          course.nameOfTeacher.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    emit(SearchUpdated(filteredCourses));
  }

  void clearSearch() {
    emit(SearchUpdated(allCourses));
  }
}