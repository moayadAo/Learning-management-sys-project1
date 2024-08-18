// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learning_system/src/features/course/data/models/course/new_model.dart/course_data_model_new.dart';
// import 'course_item.dart';

// import 'search_state.dart';

// class SearchCubit extends Cubit<SearchState> {
//   final List<CourseDataModelNewForGetAllApi> allCourses;

//   SearchCubit(this.allCourses) : super(SearchInitial(allCourses));

//   void updateSearch(String searchQuery) {
//     final filteredCourses = allCourses.where((course) {
//       return course.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
//           course.teacher!.firstName
//               .toLowerCase()
//               .contains(searchQuery.toLowerCase());
//     }).toList();
//     emit(SearchUpdated(filteredCourses));
//   }

//   void clearSearch() {
//     emit(SearchUpdated(allCourses));
//   }
// }
