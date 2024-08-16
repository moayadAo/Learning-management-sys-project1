import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_states.dart';
import 'package:learning_system/src/features/teacher/widget/profile_teacher_widget.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherCubit, TeacherStates>(
      builder: (context, state) {
        return Scaffold(
            body: ProfileTeacherWidget(
                totalTeacherWallet: 250,
                imageUrl: "imageUrl",
                email: "email@gmail.com",
                subject: "subject",
                nameOfTeacher: "nameOfTeacher",
                onTapAccount1: () {},
                onTapAccount2: () {},
                teacher: true,
                cvUrl: () {  context.read<TeacherCubit>().loadCv(
                    "https://drive.google.com/uc?export=download&id=1xxvwYFCH1x_vilvOMwUsKduqJIB7UeXv");

                Navigator.pushNamed(context, AppRoute.teacherCv);}));
      },
    );
  }
}
