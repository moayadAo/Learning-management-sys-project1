import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/cubit/course/course_state.dart';
import 'package:learning_system/src/features/course/data/models/course/new_model.dart/course_data_model_new.dart';
import 'package:learning_system/src/features/course/presentation/course/widget/brows_course_widget.dart';
import 'package:learning_system/src/features/course/presentation/course/widget/sliver_app_brows_course_widget.dart';

class BrowseCourseScreen extends StatelessWidget {
  BrowseCourseScreen({super.key});
  List<CourseDataModelNewForGetAllApi> course = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          course = context.read<CourseCubit>().newListCourse;
          return CustomScrollView(
            slivers: [
              SliverAppBrowsCourseWidget(
                text: 'Browse Courses',
                // iconClosePressed: () =>
                //     context.read<SearchCubit>().clearSearch(),
                // onChanged: (query) =>
                //     context.read<SearchCubit>().updateSearch(query),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    String name = '';
                    // Check if there are teachers associated with the course
                    if (course[index].teacher != null &&
                        course[index].teacher!.isNotEmpty) {
                      name =
                          '${course[index].teacher![0].firstName} ${course[index].teacher![0].lastName}';
                    }
                    return CourseWidget(
                        onTap: () async {
                          await context
                              .read<CourseCubit>()
                              .getCourse(courseId: course[index].id);

                          // //test:
                          // await context
                          //     .read<CourseCubit>()
                          //     .getCourse(courseId: '66c0052877e5c730723bd5f8');
                          Navigator.pushNamed(
                              context, AppRoute.detailCoursePage);
                        },
                        imageUrl: AssetsManager.createCourse,
                        nameOfTeacher: name,
                        nameOfCourse: course[index].name,
                        rate: course[index].rate ?? 0,
                        priceOfCourse: course[index].cost!);
                  },
                  childCount: course.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
