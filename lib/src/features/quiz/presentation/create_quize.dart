import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/text_form_field/text_form_field.dart';
import 'package:learning_system/src/features/quiz/cubit/create_quiz/create_quiz_cubit.dart';

class CreateQuiz extends StatelessWidget {
  const CreateQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: AppSize.s160,
                height: AppSize.s160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsManager.quizIcon),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Form(
                key: context.read<CreateQuizCubit>().formState,
                autovalidateMode:AutovalidateMode.always ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p12),
                      child: RichText(
                        text: TextSpan(
                          text: "Enter the title of quiz",
                          style: getHeadLineMeduim(
                              fontSize: AppSize.s20, color: ColorManager.black),
                        ),
                      ),
                    ),
                   TextFormFieldWidget(
                     controller:context.read<CreateQuizCubit>().titleQuiz ,
                     prefixIcon: IconManager.titleQuiz,
                     hintText: "Title...",
                     isPrefix: true,


                   ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Enter the options of quiz",
                          style: getHeadLineMeduim(
                              fontSize: AppSize.s20, color: ColorManager.black),
                        ),
                      ),
                    ),
                    TextFormFieldWidget(
                      controller:context.read<CreateQuizCubit>().firstQuestionQuiz ,
                      prefixIcon: IconManager.a,
                      hintText: "First Option...",
                      isPrefix: true,


                    ),
                    TextFormFieldWidget(
                      controller:context.read<CreateQuizCubit>().secondQuestionQuiz ,
                      prefixIcon: IconManager.b,
                      hintText: "Second Option...",
                      isPrefix: true,


                    ),
                    TextFormFieldWidget(
                      controller:context.read<CreateQuizCubit>().titleQuiz ,
                      prefixIcon: IconManager.c,
                      hintText: "Third Option...",
                      isPrefix: true,


                    ),
                    TextFormFieldWidget(
                      controller:context.read<CreateQuizCubit>().fourQuestionQuiz ,
                      prefixIcon: IconManager.d,
                      hintText: "Four Option...",
                      isPrefix: true,


                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Enter the correct answer ",
                          style: getHeadLineMeduim(
                              fontSize: AppSize.s20, color: ColorManager.black),
                        ),
                      ),
                    ),
                    TextFormFieldWidget(
                      controller:context.read<CreateQuizCubit>().correctAnswer ,
                      prefixIcon: IconManager.correct,
                      hintText: "Correct Answer...",
                      isPrefix: true,

                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    splashColor: Colors.black,
                    minWidth: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height / 15,
                    color: ColorManager.SecondaryColorLogo,
                    child: const Text(
                      'Submit ',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "quiz_page");
                    },
                  ),
                  SizedBox(height: AppPadding.p80,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
