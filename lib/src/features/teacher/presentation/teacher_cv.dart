import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit_2.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_state.dart';

class TeacherCv extends StatelessWidget {
  const TeacherCv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.SecondaryColorLogo,
        leading: BackButton(
          color: ColorManager.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: RichText(
          text: TextSpan(
            text: "CV",
            style: getHeadLineLarge(
                fontSize: FontSize.s22, color: ColorManager.white),
          ),
        ),
      ),
      body: BlocBuilder<TeacherCubit2, TeacherStates>(
        builder: (context, state) {
          return state is CvLoadingTeacherState
              ? const Center(child: CircularProgressIndicator())
              : state is CvLoadedTeacherState
                  ? const PDF().cachedFromUrl(
                      context.read<TeacherCubit2>().cvUrl,
                      placeholder: (progress) =>
                          Center(child: Text('$progress %')),
                      errorWidget: (error) => Center(
                        child: Text(
                          error.toString(),
                        ),
                      ),
                    )
                  : state is CvErrorTeacherState
                      ? Center(child: Text(state.message))
                      : const Center(
                          child: Text('Unknown Error'),
                        );
        },
      ),
    );
  }
}
