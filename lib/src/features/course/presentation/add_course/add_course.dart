import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/text_form_field/text_form_field.dart';
import 'package:learning_system/src/features/course/mm/cubit/add_coure/add_course_cubit.dart';
import 'package:learning_system/src/features/video/cubit/video_cubit.dart';
import 'package:learning_system/src/features/video/cubit/video_state.dart';

class CreateCourse extends StatelessWidget {
  const CreateCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                pinned: true,
                actions: [],
                excludeHeaderSemantics: true,
                expandedHeight: 160,
                flexibleSpace: FlexibleSpaceBar(
                  background: BlocBuilder<VideoCubit, VideoState>(
                    builder: (context, state) {
                      return state is LoadingUploadVideoState
                          ? LoadingIndicator()
                          : state is SuccessUploadVideoState
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorManager.grayLight),
                                    color: ColorManager.SecondaryColorLogo,
                                  ),
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text:
                                            "Size of your videos is ${context.read<VideoCubit>().totalSizeInMB}",
                                        style: getHeadLineMeduim(
                                            fontSize: AppSize.s20,
                                            color: ColorManager.white),
                                      ),
                                    ),
                                  ),
                                )
                              : state is ErrorUploadVideoState
                                  ? Stack(children: [
                                      Image(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        image: AssetImage(
                                          AssetsManager.logoOfCourse,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: ColorManager.grayLight),
                                          color: ColorManager.redBright,
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      "Wrong \nPlease try again !",
                                                  style: getHeadLineMeduim(
                                                      fontSize: AppSize.s20,
                                                      color:
                                                          ColorManager.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: AppPadding.p20,
                                            ),
                                            InkWell(
                                                splashColor: Colors.black,
                                                onTap: () {
                                                  context
                                                      .read<VideoCubit>()
                                                      .pickMultipleVideos();
                                                },
                                                child: IconManager.minPlus)
                                          ],
                                        ),
                                      ),
                                    ])
                                  : InkWell(
                                      onTap: () {
                                        context
                                            .read<VideoCubit>()
                                            .pickMultipleVideos();
                                      },
                                      child: Stack(children: [
                                        Image(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          image: AssetImage(
                                            AssetsManager.logoOfCourse,
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorManager.grayLight),
                                            color: Colors.white70,
                                          ),
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child:
                                              Center(child: IconManager.plus),
                                        ),
                                      ]),
                                    );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Form(
                  //key: context.read<CreateQuizCubit>().formState,
                  autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p12),
                          child: RichText(
                            text: TextSpan(
                              text: "Course ID ",
                              style: getHeadLineMeduim(
                                  fontSize: AppSize.s20,
                                  color: ColorManager.black),
                            ),
                          ),
                        ),
                        TextFormFieldWidget(
                          controller: context.read<AddCourseCubit>().courseId,
                          hintText: "Enter the Course ID...",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: "Course Name",
                              style: getHeadLineMeduim(
                                  fontSize: AppSize.s20,
                                  color: ColorManager.black),
                            ),
                          ),
                        ),
                        TextFormFieldWidget(
                          controller:
                              context.read<AddCourseCubit>().nameOfCourse,
                          hintText: "Enter the name of course...",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              text: "Description",
                              style: getHeadLineMeduim(
                                  fontSize: AppSize.s20,
                                  color: ColorManager.black),
                            ),
                          ),
                        ),
                        TextFormFieldWidget(
                          controller:
                              context.read<AddCourseCubit>().description,
                          hintText: "Enter the description of the course...",
                          minLines: 4,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          splashColor: Colors.black,
                          minWidth: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          color: ColorManager.SecondaryColorLogo,
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.coursePageScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
