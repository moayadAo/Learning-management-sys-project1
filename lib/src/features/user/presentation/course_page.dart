import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/widgets/course_page_widget.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';

import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/cubit/course/course_state.dart';

import '../../../../core/utils/color_manager.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          return CoursePageWidget(
              nameOfCourse: "nameOfCourse",
              duration: "duration",
              price: 150,
              description: "description",
              whatYouLearn: "whatYouLearn",
              hasPurchasedCourse: true,
              durationList: "durationList",
              nameOfCourseList: "nameOfCourseList",
              descriptionRate: "descriptionRate",
              reviewNameStudent: "reviewNameStudent");
        },
      ),
      bottomNavigationBar: 1 == 3
          ? const SizedBox() // or any other widget for the 'true' case
          : BottomAppBar(
              elevation: 10.2,
              color: ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    color: ColorManager.SecondaryColorLogo,
                    onPressed: () {
                      // Navigator.pushNamed(context, 'courseVideoPage');
                      // Navigator.pushNamed(context, AppRoute.articleDetails);
                      Navigator.pushNamed(context, AppRoute.profileScreen);
                    },
                    text: "Buy Now",
                  )
                ],
              ),
            ),
    );
  }
}
