import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/answer/answer_state.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/cubit_quiz.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/quiz_state.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard(
      {super.key,
      required this.isSelected,
      required this.selectedAnswerIndex,
      required this.question});

  final bool isSelected;
  final int? selectedAnswerIndex;
  final String question;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnswerCubit(),
      child: BlocBuilder<AnswerCubit, AnswerState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
            ),
            child: selectedAnswerIndex != null
                // if one option is chosen
                ? Container(
                    // height: 70,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? ColorManager.SecondaryColorLogo
                          : ColorManager.yellow,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      border: Border.all(
                        color: isSelected
                            ? ColorManager.primaryColorLogo
                            : ColorManager.black,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // state is SubmitAnswerSuccess
                        //     ? buildCorrectIcon()
                        //     : state is SubmitAnswerWrong
                        //     ? buildWrongIcon()
                        //     : const SizedBox.shrink(),
                      ],
                    ),
                  )
                // If no option is selected
                : Container(
                    //  height: 70,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: ColorManager.yellow,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      border: Border.all(
                        color: ColorManager.black,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
