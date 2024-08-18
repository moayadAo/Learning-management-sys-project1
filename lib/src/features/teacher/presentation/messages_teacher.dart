import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit_2.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_state.dart';
import 'package:learning_system/src/features/teacher/widget/messages_teacher_widget.dart';

class MessagesTeacher extends StatelessWidget {
  const MessagesTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TeacherCubit2, TeacherStates>(
        builder: (context, state) {
          var messeages =
              context.read<TeacherCubit2>().getAllMessagesTeacherModel;
          return state is GetAllMessagesTeacherSuccessState
              ? MessagesTeacherWidget(
                  messages: messeages!.data!.messages!,
                  childCount: messeages.data!.messages!.length,
                )
              : state is GetAllMessagesTeacherFailureState
                  ? Center(
                      child: Text(state.message),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
