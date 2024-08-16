import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/src/features/Abd/institute/cubit/search_cubit/search_cubit.dart';
import 'package:learning_system/src/features/Abd/institute/cubit/search_cubit/search_state.dart';
import 'package:learning_system/src/features/Abd/institute/widget/sliver_app_bar_scholarship/sliver_app_bar_scholarship.dart';
import 'package:learning_system/src/features/user/cubit/search_cubit/course_item.dart';

class ScholarshipsPage extends StatelessWidget {
  ScholarshipsPage({super.key});
  final List<CourseItem> course = CourseItem.courseItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScholarshipsCubit(course),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
          SliverAppBarScholarship(

            onChanged:  (query) =>
              context.read<SearchScholarshipsCubit>().updateSearch(query), iconClosePressed: () =>
              context.read<SearchScholarshipsCubit>().clearSearch(),),
            BlocBuilder<SearchScholarshipsCubit, SearchScholarshipsState>(
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final course = state.filteredCourses[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoute.coursePageScreen);
                        },
                        child: Container(
                          //height: AppSize.s130,
                          width:
                          AppSize.s100 * 2.6, // Adjust the width as needed
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: course.nameOfCourse,
                                    style: getBoldStyle(
                                        fontSize: AppSize.s20,
                                        color: ColorManager.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: course.nameOfTeacher,
                                    style: getTitleMeduim(
                                        fontSize: AppSize.s14,
                                        color: ColorManager.grayLight),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppPadding.p6,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Condition",
                                    style: getSemiBoldStyle(
                                        fontSize: AppSize.s14,
                                        color: ColorManager.redBright),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppPadding.p6,
                                ),
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                          text: "Validity of the scholarship : ",
                                          style: getHeadLineLarge(
                                            fontSize: AppSize.s12,
                                            color:
                                            ColorManager.SecondaryColorLogo,
                                          ),
                                        )),
                                    RichText(
                                        text: TextSpan(
                                          text: "10/0/2000",
                                          style: getRegularStyle(
                                            fontSize: AppSize.s12,
                                            color:
                                            ColorManager.redBright,
                                          ),
                                        )),

                                  ],
                                ),
                                Card(),
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                          text: "Last chance to apply: ",
                                          style: getHeadLineLarge(
                                            fontSize: AppSize.s12,
                                            color:
                                            ColorManager.SecondaryColorLogo,
                                          ),
                                        )),
                                    RichText(
                                        text: TextSpan(
                                          text: "10/0/2000",
                                          style: getRegularStyle(
                                            fontSize: AppSize.s12,
                                            color:
                                            ColorManager.redBright,
                                          ),
                                        )),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: state.filteredCourses.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
