// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learning_system/src/features/user/cubit/search_cubit/course_item.dart';
// import 'search_state.dart';

// class SearchScholarshipsCubit extends Cubit<SearchScholarshipsState> {
//   final List<CourseItem> allCourses;

//   SearchScholarshipsCubit(this.allCourses) : super(InitialSearchScholarshipsState(allCourses));

//   void updateSearch(String searchQuery) {
//     final filteredCourses = allCourses.where((course) {
//       return course.nameOfCourse.toLowerCase().contains(searchQuery.toLowerCase()) ||
//           course.nameOfTeacher.toLowerCase().contains(searchQuery.toLowerCase());
//     }).toList();
//     emit(UpdatedSearchScholarshipsState(filteredCourses));
//   }

//   void clearSearch() {
//     emit(UpdatedSearchScholarshipsState(allCourses));
//   }
// }