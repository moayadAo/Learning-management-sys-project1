import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/list_tile_widget/list_tile_widget.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit_2.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_state.dart';

class GetAllTeacherScreen extends StatelessWidget {
  const GetAllTeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TeacherCubit2, TeacherStates>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                foregroundColor: ColorManager.white,
                backgroundColor: ColorManager.SecondaryColorLogo,
                title: RichText(
                  text: TextSpan(
                    text: "Teachers",
                    style: getSemiBoldStyle(
                        fontSize: FontSize.s24, color: ColorManager.white),
                  ),
                ),
              ),
              state is GetAllTeachersSuccessState
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var teachers = context
                              .read<TeacherCubit2>()
                              .getAllTeacherModel!
                              .data;
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p12,
                                  vertical: AppPadding.p8),
                              child: ListTileWidget(
                                imageUrl: teachers[index].image,
                                title:
                                    '${teachers[index].firstName} ${teachers[index].lastName}',
                                subTitle: teachers[index].subject,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoute.teacherProfile,
                                  );
                                },
                                decade: '${teachers[index].status} ',
                              ));
                        },
                        childCount: context
                            .read<TeacherCubit2>()
                            .getAllTeacherModel!
                            .data
                            .length,
                      ),
                    )
                  : state is GetAllTeachersFailureState
                      ? Center(child: Text(state.message))
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ],
          );
        },
      ),
    );
  }
}
