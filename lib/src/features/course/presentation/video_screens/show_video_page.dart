import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/src/features/course/cubit/video/video_cubit.dart';
import 'package:learning_system/src/features/course/cubit/video/video_states.dart';

class ShowVideoPage extends StatelessWidget {
  const ShowVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          context
              .read<VideoCubit>()
              .displayVideo(context.read<VideoCubit>().videoData!.pathVideo);
        },
        child: Center(
          child: SizedBox(
            width: getWidth(context),
            child: BlocBuilder<VideoCubit, VideoStates>(
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
                            image: const AssetImage(
                              AssetsManager.logoOfCourse,
                            ),
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}
