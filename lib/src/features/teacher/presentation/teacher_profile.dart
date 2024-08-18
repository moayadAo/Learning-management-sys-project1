import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit_2.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_state.dart';
import 'package:learning_system/src/features/teacher/widget/profile_teacher_widget.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherCubit2, TeacherStates>(
      builder: (context, state) {
        var teacherProfile =
            context.read<TeacherCubit2>().getProfileTeacherModel!;
        return Scaffold(
          body: state is GetProfileTeacherSuccessState
              ? ProfileTeacherWidget(
                  totalTeacherWallet: 250,
                  imageUrl: teacherProfile.image,
                  email: teacherProfile.status,
                  subject: teacherProfile.subject,
                  nameOfTeacher:
                      '${teacherProfile.firstName} ${teacherProfile.lastName}',
                  onTapAccount1: () {},
                  onTapAccount2: () {},
                  teacher: true,
                  cvUrl: () {
                    context.read<TeacherCubit2>().loadCv(
                          teacherProfile.cv,
                        );

                    Navigator.pushNamed(context, AppRoute.teacherCv);
                  },
                )
              : state is GetProfileTeacherFailureState
                  ? Center(child: Text(state.message))
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        );
      },
    );
  }
}
