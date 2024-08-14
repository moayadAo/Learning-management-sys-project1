import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/data/models/quiz_model/quiz_model.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/quiz/answer_card.dart';
import 'package:learning_system/core/widgets/quiz/next_button.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_state.dart';
import 'package:learning_system/src/features/quiz/cubit/cubit_quiz.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz_state.dart';
import 'package:learning_system/src/features/quiz/presentation/quiz_result.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
      final question =
          QuestionInfo.questions[context.read<QuizCubit>().questionIndex];
      return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsManager.quizIcon),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //  height: AppSize.s80,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      color: ColorManager.yellow,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          text: question.question,
                          style: getBoldStyle(
                              fontSize: AppSize.s20, color: ColorManager.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: question.options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (state is SelectAnswerState ||
                              state is InitialQuizState) {
                            context.read<QuizCubit>().pickAnswer(index);
                          }
                        },
                        child: AnswerCard(
                          question: question.options[index],
                          isSelected:
                              context.read<QuizCubit>().selectedAnswerIndex ==
                                  index,
                          selectedAnswerIndex:
                              context.read<QuizCubit>().selectedAnswerIndex,
                        ),
                      );
                    },
                  ),
                ),
               /* SliverToBoxAdapter(
                  child: BlocBuilder<AnswerCubit, AnswerState>(
                      builder: (context, state) {
                    if (state is WrongAnswerState) {
                      return Center(
                          child: Text(
                        'Wrong',
                        style: getRegularStyle(color: ColorManager.redBright),
                      ));
                    } else if (state is CorrectAnswerState) {
                      return Center(
                          child: Text(
                        'Correct',
                        style: getRegularStyle(color: Colors.green),
                      ));
                    } else {
                      return Center(
                          child: Text(
                        'there is not answer',
                        style: getRegularStyle(color: ColorManager.redBright),
                      ));
                    }
                  }),
                ),*/
                SliverToBoxAdapter(
                  child: state is NextQuizState
                      ? MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          splashColor: Colors.black,
                          minWidth: MediaQuery.of(context).size.width * 0.88,
                          height: MediaQuery.of(context).size.height / 15,
                          color: ColorManager.SecondaryColorLogo,
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                          onPressed: () =>
                              context.read<QuizCubit>().reset(context),
                        )
                      : state is FinishQuizState
                          ? MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              splashColor: Colors.black,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height / 15,
                              color: ColorManager.SecondaryColorLogo,
                              child: Text(
                                'finish',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => ResultScreen(
                                      score: context.read<QuizCubit>().score,
                                    ),
                                  ),
                                );
                              },
                            )
                          : MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              splashColor: Colors.black,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height / 15,
                              color: ColorManager.SecondaryColorLogo,
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              onPressed: () {
                                context.read<QuizCubit>().isSubmit(context);
                                // Navigator.of(context).pushReplacement(
                                //   MaterialPageRoute(
                                //     builder: (_) => ResultScreen(
                                //       score: context.read<QuizCubit>().score,
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                ),
              ],
            ),
          ));
    });
  }
}
