import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/src/features/course/cubit/video/video_cubit.dart';
import 'package:learning_system/src/features/course/cubit/video/video_states.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/cubit/follow_course_cubit.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/cubit/follow_course_state.dart';

class FollowCoursePage extends StatelessWidget {
  const FollowCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: AppSize.s240,
                maxHeight: AppSize.s240,
                child:  Stack(
                  children: [BlocBuilder<VideoCubit, VideoStates>(
                    builder: (context, state) {
                      return state is LoadingVideoState
                          ? LoadingIndicator()
                          : state is SuccessVideoState
                          ? Container(
                        child: FlickVideoPlayer(
                            flickManager: context
                                .read<VideoCubit>()
                                .flickManager),
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
                      top: 16.0, // Adjust the top position to fit your layout
                      left: 16.0, // Adjust the left position to fit your layout
                      child: IconManager.arrowLeft
                    ),
              ]  ),
              ),
            ),
      SliverToBoxAdapter(
        child:  Container(
      color: ColorManager.primary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: RichText(
                text: TextSpan(
                  text: "Title of Video",
                  style: getBoldStyle(
                      fontSize: 25, color: ColorManager.white),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: RichText(
                text: TextSpan(
                  text: "Description of Video",
                  style: getRegularStyle(
                      fontSize: 16, color: ColorManager.white),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s30,
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle
              ),
              child: RichText(
                text: TextSpan(
                  text: "Name of teacher ",
                  style: getSemiBoldStyle(
                      fontSize: 20, color: ColorManager.white),
                ),
              ),
            ),
          ],
        ),
      ),
        ),
      ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return BlocBuilder<FollowCourseCubit, FollowCourseState>(
                    builder: (context, state) {
                          return ListTile(
                            tileColor: context.read<FollowCourseCubit>().selectedIndex == index
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
                             context.read<FollowCourseCubit>().isSelectVideo(index);
                            },
                          );
                        },
                      );
      
      
                },
                childCount: 20, // Number of items in the list
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
