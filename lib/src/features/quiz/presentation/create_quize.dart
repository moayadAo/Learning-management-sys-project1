import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/api/dio_consumer.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/dialog/dialog.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/snack_bar.dart';
import 'package:learning_system/core/widgets/text_form_field/text_form_field.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/question/question_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/question/question_state.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/cubit_quiz.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/quiz_state.dart';

class CreateQuiz extends StatelessWidget {
  bool showQuestionForm = false;
  bool _isSnackBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => QuestionCubit(api: DioConsumer(dio: Dio())),
        child: BlocConsumer<QuestionCubit, QuestionState>(
          listener: (context, state) {
            if (state is CreateQuestionSuccessState) {
              context
                  .read<QuizCubit>()
                  .questionIds
                  .add(context.read<QuestionCubit>().id!);
              context.read<QuestionCubit>().resetQuestion();
              showQuestionForm = false;
              context
                  .read<QuestionCubit>()
                  .changeShowQuestionFormState(showQuestionForm);
              log('length  = ${context.read<QuizCubit>().questionIds.length} ');
              ScaffoldMessenger.of(context).showSnackBar(SnackBarMessage(
                      message: 'Question Creaetd Succesful',
                      color: ColorManager.greenLightButton)
                  .buildSnackBar(context));
            } else if (state is CreateQuestionFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarMessage(message: 'Question Creaetd not complete ')
                      .buildSnackBar(context));
            }
          },
          builder: (context, state) {
            GlobalKey<FormState> formState = GlobalKey<FormState>();
            final cubit = context.read<QuestionCubit>();

            return Padding(
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
                      key: formState,
                      // autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppPadding.p12),
                            child: RichText(
                              text: TextSpan(
                                text: "Enter the title of quiz",
                                style: getHeadLineMeduim(
                                    fontSize: AppSize.s20,
                                    color: ColorManager.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSize.s20),
                          TextFormFieldWidget(
                            controller: context.read<QuizCubit>().titleQuiz,
                            prefixIcon: IconManager.titleQuiz,
                            hintText: "Title...",
                            isPrefix: true,
                          ),
                          const SizedBox(height: AppSize.s20),
                          TextFiledApp(
                            controller: context.read<QuizCubit>().quizOrder,
                            hintText: 'Enter Order of video in course',
                            iconData: Icons.arrow_outward_rounded,
                            validator: (p0) => ValidatorManager().validateName(
                                p0!,
                                message: 'please enter order of video'),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: AppSize.s40),
                          if (state is showQuestionState ||
                              state is CreateQuestionLoadingState ||
                              state is CreateQuestionFailureState) ...[
                            state is CreateQuestionLoadingState
                                ? LoadingIndicator()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Enter the question details",
                                        style: getHeadLineMeduim(
                                            fontSize: AppSize.s20,
                                            color: ColorManager.black),
                                      ),
                                    ),
                                  ),
                            TextFormFieldWidget(
                              controller: cubit.questionTitle,
                              prefixIcon: IconManager.titleQusetion,
                              hintText: "Your Question...",
                              isPrefix: true,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.firstQuestionQuiz,
                              prefixIcon: IconManager.a,
                              hintText: "First Option...",
                              isPrefix: true,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.secondQuestionQuiz,
                              prefixIcon: IconManager.b,
                              hintText: "Second Option...",
                              isPrefix: true,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.thirdQuestionQuiz,
                              prefixIcon: IconManager.c,
                              hintText: "Third Option...",
                              isPrefix: true,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.fourQuestionQuiz,
                              prefixIcon: IconManager.d,
                              hintText: "Fourth Option...",
                              isPrefix: true,
                            ),
                            TextFormFieldWidget(
                              controller: cubit.correctAnswer,
                              prefixIcon: IconManager.correct,
                              hintText: "Correct Answer...",
                              isPrefix: true,
                            ),
                            const SizedBox(height: AppPadding.p16),
                            Center(
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                splashColor: Colors.black,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.88,
                                height: MediaQuery.of(context).size.height / 15,
                                color: ColorManager.SecondaryColorLogo,
                                child: const Text(
                                  'Create Question',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                onPressed: () async {
                                  log('title question issssss:${cubit.questionTitle.text} ');
                                  // Logic to create question
                                  if (cubit.correctAnswer.text != '' &&
                                      cubit.questionTitle.text != '' &&
                                      cubit.firstQuestionQuiz.text != '' &&
                                      cubit.secondQuestionQuiz.text != '' &&
                                      cubit.thirdQuestionQuiz.text != '' &&
                                      cubit.fourQuestionQuiz.text != '') {
                                    await cubit.createQuestion(
                                        answers: cubit.getAnswerList(),
                                        question: cubit.questionTitle.text,
                                        trueAnswer: cubit.correctAnswer.text);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBarMessage(
                                                message: 'there is wrong ')
                                            .buildSnackBar(context));
                                  }
                                },
                              ),
                            ),
                          ] else ...[
                            Center(
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                splashColor: Colors.black,
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.88,
                                height: MediaQuery.of(context).size.height / 15,
                                color: ColorManager.SecondaryColorLogo,
                                child: const Text(
                                  'Add Question',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                onPressed: () {
                                  // Show the question form when "Add Question" is pressed
                                  // setState(() {

                                  showQuestionForm = true;
                                  cubit.changeShowQuestionFormState(
                                      showQuestionForm);
                                  // });
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  BlocConsumer<QuizCubit, QuizState>(
                    listener: (context, state) {
                      if (state is CreateSuccessQuizState) {
                        _showSuccessDialog(context);
                      }
                    },
                    builder: (context, state) {
                      final quizCubit = context.read<QuizCubit>();
                      return state is CreateLoadingQuizState
                          ? SliverToBoxAdapter(child: LoadingIndicator())
                          : SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  const SizedBox(height: AppSize.s34),
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    splashColor: Colors.black,
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.88,
                                    height:
                                        MediaQuery.of(context).size.height / 15,
                                    color: ColorManager.SecondaryColorLogo,
                                    child: const Text(
                                      'Create Quiz',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      if (quizCubit.questionIds.isNotEmpty &&
                                          quizCubit.titleQuiz.text != '' &&
                                          quizCubit.quizOrder.text != '') {
                                        if (!context
                                            .read<CourseCubit>()
                                            .order
                                            .contains(int.parse(quizCubit
                                                .quizOrder.text
                                                .trim()))) {
                                          await quizCubit.createQuiz(
                                              name: quizCubit.titleQuiz.text,
                                              questionId: quizCubit.questionIds,
                                              order: int.parse(quizCubit
                                                  .quizOrder.text
                                                  .trim()));
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
                                                            'info of quiz there error')
                                                    .buildSnackBar(context),
                                              )
                                              .closed
                                              .then((reason) {
                                            _isSnackBarVisible = false;
                                          });
                                        }
                                      }
                                      // Logic to create the quiz
                                      // context.read<CreateQuizCubit>().createQuiz();
                                      // Navigator.pushNamed(context, "quiz_page");
                                    },
                                  ),
                                  // SizedBox(height: AppPadding.p80),
                                ],
                              ),
                            );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showConfirm(
        title: 'Quiz Create Done',
        context: context,
        confirm: () {
          context.read<CourseCubit>().quizId.add(context.read<QuizCubit>().id!);
          context
              .read<CourseCubit>()
              .order
              .add(int.parse(context.read<QuizCubit>().quizOrder.text.trim()));
          context.read<QuizCubit>().resetQuizAfterUpdate();
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    });
  }
}
