import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/dialog/dialog.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/snack_bar.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/core/widgets/white_blue_button.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/cubit/video/video_cubit.dart';
import 'package:learning_system/src/features/course/cubit/video/video_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateVideoPage extends StatelessWidget {
  File? _videoFile;
  bool _isSnackBarVisible = false;
  final nameController = TextEditingController();

  final durationController = TextEditingController();

  final descriptionController = TextEditingController();

  CreateVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<VideoCubit, VideoStates>(
      listener: (context, state) {
        if (state is LoadVideoFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarMessage(message: 'choose your video please')
                  .buildSnackBar(context));
        }
        if (state is CreateVideoSuccessState) {
          _showSuccessDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: getHeight(context) / 3,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    AssetsManager.createVideo1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        state is LoadVideoLoadingState
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  _videoFile = await context
                                      .read<VideoCubit>()
                                      .pickAndUploadVideo();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      state is LoadVideoSuccessState
                                          ? ColorManager.lightGrey
                                          : ColorManager.primaryColorLogo,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p16),
                                  textStyle:
                                      getMediumStyle(fontSize: FontSize.s18),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state is LoadVideoSuccessState
                                        ? const Icon(
                                            Icons
                                                .done_outline, // The icon you want to display
                                            color: ColorManager
                                                .white, // Icon color
                                          )
                                        : const Icon(
                                            Icons
                                                .upload_file, // The icon you want to display
                                            color: ColorManager
                                                .black, // Icon color
                                          ),
                                    const SizedBox(width: AppMargin.m6),
                                    // Spacing between icon and text
                                    state is LoadVideoSuccessState
                                        ? const Text(
                                            'Video Uploaded',
                                            style: TextStyle(
                                                color: ColorManager
                                                    .whiteNiceButton),
                                          )
                                        : const Text(
                                            'Upload Video',
                                            style: TextStyle(
                                                color: ColorManager
                                                    .blackColorLogo),
                                          ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: AppPadding.p35),
                        TextFiledApp(
                          hintText: 'Enter video name',
                          controller: nameController,
                          iconData: Icons.title,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter Title of video'),
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: descriptionController,
                          hintText: 'Enter video description',
                          iconData: Icons.description,
                          maxLine: 3,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: durationController,
                          hintText: 'Enter video duration (in minutes)',
                          iconData: Icons.timer,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter duration of video'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: context.read<VideoCubit>().videoOrder,
                          hintText: 'Enter Order of video in course',
                          iconData: Icons.arrow_outward_rounded,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter order of video'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: AppPadding.p32),
                        state is CreateVideoLoadingState
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      _videoFile != null) {
                                    if (!context
                                        .read<CourseCubit>()
                                        .order
                                        .contains(int.parse(context
                                            .read<VideoCubit>()
                                            .videoOrder
                                            .text
                                            .trim()))) {
                                      context.read<VideoCubit>().createVideo(
                                          order: int.parse(context
                                              .read<VideoCubit>()
                                              .videoOrder
                                              .text
                                              .trim()),
                                          name: nameController.text,
                                          duration: int.parse(
                                              durationController.text),
                                          video: _videoFile!,
                                          description:
                                              descriptionController.text);
                                    } else {
                                      if (!_isSnackBarVisible) {
                                        _isSnackBarVisible = true;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                              SnackBarMessage(
                                                      message:
                                                          'choose the order is revrsed')
                                                  .buildSnackBar(context),
                                            )
                                            .closed
                                            .then((reason) {
                                          _isSnackBarVisible = false;
                                        });
                                      }
                                    }
                                  } else {
                                    if (!_isSnackBarVisible) {
                                      _isSnackBarVisible = true;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                            SnackBarMessage(
                                                    message:
                                                        'choose your video please')
                                                .buildSnackBar(context),
                                          )
                                          .closed
                                          .then((reason) {
                                        _isSnackBarVisible = false;
                                      });
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorManager.blueLightButton,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPadding.p16),
                                    textStyle: const TextStyle(
                                        fontSize: FontSize.s18,
                                        color: ColorManager.blackColorLogo,
                                        fontWeight: FontWegihtManager.regular),
                                    iconColor: ColorManager.white),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons
                                          .celebration_rounded, // The icon you want to display
                                    ),
                                    SizedBox(
                                        width: AppMargin
                                            .m6), // Spacing between icon and text
                                    Text(
                                      'Create Video',
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: AppPadding.p20),
                        WhiteBlueButton(
                          height: 50,
                          label: 'cancel',
                          isBlue: false,
                          colorbut: ColorManager.redBright,
                          width: 50,
                          onPressed: () {
                            Navigator.pop(context);
                            context.read<VideoCubit>().resetVideoAfterCreate();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showConfirm(
        title: 'Video Create Done',
        context: context,
        confirm: () {
          context
              .read<CourseCubit>()
              .videoId
              .add(context.read<VideoCubit>().id!);
          context.read<CourseCubit>().order.add(
              int.parse(context.read<VideoCubit>().videoOrder.text.trim()));
          context.read<VideoCubit>().resetVideoAfterCreate();
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    });
  }
}
