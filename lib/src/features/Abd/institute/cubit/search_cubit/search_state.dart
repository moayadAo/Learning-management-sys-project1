import 'package:learning_system/src/features/user/cubit/search_cubit/course_item.dart';


abstract class SearchScholarshipsState {
  final List<CourseItem> filteredCourses;

  SearchScholarshipsState(this.filteredCourses);
}

class InitialSearchScholarshipsState extends SearchScholarshipsState {
  InitialSearchScholarshipsState(List<CourseItem> filteredCourses) : super(filteredCourses);
}

class UpdatedSearchScholarshipsState extends SearchScholarshipsState {
  UpdatedSearchScholarshipsState(List<CourseItem> filteredCourses) : super(filteredCourses);
}