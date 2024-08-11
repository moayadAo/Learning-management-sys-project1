import 'course_item.dart';

abstract class SearchState {
  final List<CourseItem> filteredCourses;

  SearchState(this.filteredCourses);
}

class SearchInitial extends SearchState {
  SearchInitial(List<CourseItem> filteredCourses) : super(filteredCourses);
}

class SearchUpdated extends SearchState {
  SearchUpdated(List<CourseItem> filteredCourses) : super(filteredCourses);
}