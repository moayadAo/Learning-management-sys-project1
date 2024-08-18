import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/src/features/article/presentation/article_details.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/cubit/course/course_state.dart';
import 'package:learning_system/src/features/course/cubit/video/video_cubit.dart';
import 'package:learning_system/src/features/course/cubit/article/article_cubit.dart';
import 'package:learning_system/src/features/course/presentation/video_screens/show_video_page.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/cubit_quiz.dart';

class CourseDetailPage extends StatelessWidget {
  // final String courseId;

  const CourseDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (state is GetCourseLoadingState) {
              return LoadingIndicator();
            } else if (state is GetCourseSuccessState) {
              final course = context.read<CourseCubit>().course;
              final orderList = context
                  .read<CourseCubit>()
                  .courseOrder; // Assuming `order` is available in `CourseDataModel`

              return Column(
                children: [
                  // Top section for course details
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: ColorManager.mediumViolet,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course!.name,
                          style: getBoldStyle(
                            fontSize: FontSize.s24,
                            color: ColorManager.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          course.Categories ?? '',
                          style: getRegularStyle(
                            fontSize: FontSize.s18,
                            color: ColorManager.white,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Course Image
                        Image.network(
                          course.courseImage != null &&
                                  course.courseImage!.isNotEmpty
                              ? course.courseImage!
                              : 'https://d1qwl4ymp6qhug.cloudfront.net/Images%20for%20blog/Online%20Course%20Software/Online-course-creation-software.png',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                                'assets/images/course/createCourse2.png'); // Provide a local fallback image if the network image fails
                          },
                        )
                      ],
                    ),
                  ),

                  // List of course content
                  Expanded(
                    child: ListView.builder(
                      itemCount: orderList!.length,
                      itemBuilder: (context, index) {
                        final itemType =
                            orderList[index].type; // Assuming `type` exists
                        final itemId =
                            orderList[index].id; // Assuming `id` exists
                        final itemName =
                            orderList[index].name; // Assuming `name` exists

                        return ListTile(
                          title: Text(
                            itemName ?? '',
                            style: getRegularStyle(
                              fontSize: FontSize.s20,
                              color: ColorManager.black,
                            ),
                          ),
                          subtitle: Text(
                            itemType,
                            style: getLightStyle(
                              fontSize: FontSize.s16,
                              color: ColorManager.grayDark,
                            ),
                          ),
                          onTap: () =>
                              _handleItemTap(context, itemType, itemId),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is GetCourseFailureState) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: Text('Unexpected Error'));
            }
          },
        ),
      ),
    );
  }

  void _handleItemTap(BuildContext context, String itemType, String itemId) {
    if (itemType == 'video') {
      context.read<VideoCubit>().getVideoApi(videoId: itemId).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  const ShowVideoPage()), // Replace with your video page
        );
      });
    } else if (itemType == 'article') {
      context.read<ArticleCubit>().getArticleApi(articleId: itemId).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  ArticleDetails()), // Replace with your article page
        );
      });
    } else if (itemType == 'quiz') {
      // i replace itemId with this for test 66c1806970ba2b9f8e52ea25
      context
          .read<QuizCubit>()
          .getQuizApi(id: '66c1806970ba2b9f8e52ea25')
          .then((_) {
        Navigator.pushNamed(context, AppRoute.welcomeQuiz);
      });
    }
  }
}
