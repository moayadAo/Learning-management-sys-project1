import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/core/cubit_helper/image_cubit.dart';
import 'package:learning_system/core/cubit_helper/image_state.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/image_pick_widget.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/core/widgets/white_blue_button.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/cubit/course/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCoursePage extends StatelessWidget {
  final bool _isSnackBarVisible = false;
  XFile? _image;

  CreateCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) async {
        if (state is CreateCourseSuccessState) {
          await context
              .read<CourseCubit>()
              .getCourse(courseId: context.read<CourseCubit>().courseId!);
          Navigator.pushNamed(context, AppRoute.detailCoursePage);
        }
      },
      builder: (context, state) {
        final cubit = context.read<CourseCubit>();
        return Scaffold(
          backgroundColor: ColorManager.whiteNiceButton,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: getHeight(context) / 3,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    AssetsManager.createCourse,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        BlocProvider(
                            create: (context) => ImageCubit(),
                            child: BlocBuilder<ImageCubit, ImageState>(
                              builder: (context, state) {
                                return ImagePickerButton(
                                  onImageSelected: (XFile? image) {
                                    if (image != null) {
                                      _image = image;
                                      log('path -------------------- ${image.path}');
                                      context.read<ImageCubit>().win();
                                    }
                                  },
                                );
                              },
                            )),
                        const SizedBox(height: AppPadding.p35),
                        TextFiledApp(
                          hintText: 'Enter course name',
                          controller: cubit.courseName,
                          iconData: Icons.title,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter Title of course'),
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: cubit.courseCost,
                          hintText: 'Enter course cost',
                          iconData: Icons.wallet,
                          validator: (p0) => ValidatorManager()
                              .validateName(p0!, message: 'please enter cost'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: cubit.courseDuration,
                          hintText: 'Enter course duration (in days)',
                          iconData: Icons.timer,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter duration of course'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: cubit.courseLanguage,
                          hintText: 'Enter course languages',
                          iconData: Icons.language_outlined,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter language of course'),
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: cubit.courseEducationLevel,
                          hintText: 'Enter course Education Level',
                          iconData: Icons.leaderboard_rounded,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter Education Level'),
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: cubit.courseCategories,
                          hintText: 'Enter course categories ',
                          iconData: Icons.category,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: cubit.courseWhatYouWillLearn,
                          hintText: 'Enter What You Will Learn ',
                          iconData: Icons.lightbulb_outline,
                        ),
                        const SizedBox(height: AppPadding.p32),
                        WhiteBlueButton(
                          height: AppSize.s50,
                          label: "Create Video",
                          isBlue: false,
                          colorbut: ColorManager.darkBlue,
                          colorText: ColorManager.white,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.createVideoPage);
                          },
                        ),
                        const SizedBox(height: AppPadding.p20),
                        WhiteBlueButton(
                          height: AppSize.s50,
                          label: "Create Article",
                          isBlue: false,
                          colorbut: ColorManager.jewelry,
                          colorText: ColorManager.white,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.createArticlePage);
                          },
                        ),
                        const SizedBox(height: AppPadding.p20),
                        WhiteBlueButton(
                          height: AppSize.s50,
                          label: "Create Quiz",
                          isBlue: false,
                          colorbut: ColorManager.jewelry,
                          colorText: ColorManager.white,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoute.createQuizPage);
                          },
                        ),
                        const SizedBox(height: AppPadding.p32),
                        WhiteBlueButton(
                          height: AppSize.s50,
                          label: "Create Course",
                          isBlue: false,
                          colorbut: ColorManager.SecondaryColorLogo,
                          colorText: ColorManager.white,
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                (cubit.articleId.isNotEmpty ||
                                    cubit.videoId.isNotEmpty)) {
                              cubit.createCourse(
                                name: cubit.courseName.text,
                                cost:
                                    double.parse(cubit.courseCost.text.trim()),
                                duration:
                                    int.parse(cubit.courseDuration.text.trim()),
                                language: cubit.courseLanguage.text,
                                educationLevel: cubit.courseEducationLevel.text,
                                articleIds: cubit.articleId,
                                categories: cubit.courseCategories.text,
                                quizIds: cubit.quizId,
                                whatYouWillLearn:
                                    cubit.courseWhatYouWillLearn.text,
                                image: _image,
                                videoIds: cubit.videoId,
                              );
                            }
                          },
                        ),
                        // TextButton(
                        //     onPressed: () async {
                        //       await context.read<CourseCubit>().getAllCourse();
                        //       Navigator.pushNamed(
                        //           context, AppRoute.browseCoursePage);
                        //     },
                        //     child: const Text('Brwose Course')),
                        // TextButton(
                        //     onPressed: () async {
                        //       await context.read<CourseCubit>().getCourse(
                        //           courseId: '66c0052877e5c730723bd5f8');
                        //       Navigator.pushNamed(
                        //           context, AppRoute.detailCoursePage);
                        //     },
                        //     child: const Text('getCourse')),
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
}
