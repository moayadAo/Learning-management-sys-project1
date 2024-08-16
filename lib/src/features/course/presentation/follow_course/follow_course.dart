import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/src/features/course/cubit/video/video_cubit.dart';
import 'package:learning_system/src/features/course/cubit/video/video_states.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/cubit/follow_course_cubit.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/cubit/follow_course_state.dart';
import 'package:learning_system/src/features/course/presentation/rating_widget.dart';

class FollowCoursePage extends StatelessWidget {
  const FollowCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // First header that doesn't scroll
            Container(
              height: AppSize.s240,
              width: double.infinity,
              child: Stack(
                children: [
                  BlocBuilder<VideoCubit, VideoStates>(
                    builder: (context, state) {
                      return state is LoadingVideoState
                          ? LoadingIndicator()
                          : state is SuccessVideoState
                          ? FlickVideoPlayer(
                        flickManager:
                        context.read<VideoCubit>().flickManager,
                      )
                          : Image(
                        width: MediaQuery.of(context).size.width,
                        image: AssetImage(
                          AssetsManager.logoOfCourse,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: IconManager.arrowLeft,
                  ),
                ],
              ),
            ),

            // The rest of the content is scrollable
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorManager.mediumViolet,
                    pinned: false,
                    floating: false,
                    snap: false,
                    expandedHeight: AppSize.s120,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Title of Video",
                                  style: getBoldStyle(
                                      fontSize: 25, color: ColorManager.white),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: " Description of VideoDescription ",
                                  style: getRegularStyle(
                                      fontSize: 16, color: ColorManager.white),
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s30,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Name of teacher ",
                                  style: getSemiBoldStyle(
                                      fontSize: 20, color: ColorManager.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return BlocBuilder<FollowCourseCubit,
                            FollowCourseState>(
                          builder: (context, state) {
                            return ListTile(
                              tileColor: context
                                  .read<FollowCourseCubit>()
                                  .selectedIndex ==
                                  index
                                  ? ColorManager.grayLight
                                  : Colors.white,
                              leading: RichText(
                                text: TextSpan(
                                  text: "${index + 1}",
                                  style: getLightStyle(
                                      fontSize: 20, color: ColorManager.black),
                                ),
                              ),
                              title: RichText(
                                text: TextSpan(
                                  text: "Title of Video ",
                                  style: getRegularStyle(
                                      fontSize: 25, color: ColorManager.black),
                                ),
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  text: "type ",
                                  style: getRegularStyle(
                                      fontSize: AppSize.s16,
                                      color: ColorManager.grayDark),
                                ),
                              ),
                              onTap: () {
                                context.read<VideoCubit>().displayVideo();
                                context
                                    .read<FollowCourseCubit>()
                                    .isSelectVideo(index);
                              },
                            );
                          },
                        );
                      },
                      childCount: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10.2,
          color: ColorManager.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            CustomButton(
            color: ColorManager.mediumViolet,
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,  // Important to handle the keyboard
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,  // Handles keyboard
                      left: AppSize.s16,
                      right: AppSize.s16,
                      top: AppSize.s20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p12, vertical: AppPadding.p12),
                            decoration: const BoxDecoration(
                                //color: Colors.white,
                                borderRadius:
                                BorderRadius.vertical(top: Radius.circular(24))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () =>  Navigator.of(context).pop(),
                                  child: const Icon(
                                    Icons.close,
                                    size: 25,
                                    color: ColorManager.mediumViolet,
                                  ),
                                ),

                              ],
                            ),
                          ),

                          RichText(
                            text: TextSpan(
                              text: "Abd Alurhman Alrifai ",
                              style: getBoldStyle(
                                  fontSize: FontSize.s16, color: ColorManager.black),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s20,
                          ),
                          RatingWidgetCourse(
                            hasPurchasedCourse: true,
                          ),
                          SizedBox(
                            height: AppSize.s20,
                          ),
                          TextFiledApp(
                            hintText: 'Enter your experience (optional)',
                            iconData: Icons.star_border_purple500_outlined,
                          ),
                          SizedBox(
                            height: AppSize.s20,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            splashColor: Colors.black,
                            minWidth: MediaQuery.of(context).size.width * 0.88,
                            height: MediaQuery.of(context).size.height / 15,
                            color: ColorManager.mediumViolet,
                            child: const Text(
                              'Post your review',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();  // Close the bottom sheet after posting review
                            },
                          ),
                          SizedBox(height: AppSize.s30,)
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            text: "Rate this course !",
          )



          ],
          ),
        ),
      ),
    );
  }
}
