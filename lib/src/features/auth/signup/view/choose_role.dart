import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/widgets/arrow_back.dart';
import 'package:learning_system/src/features/auth/signup/view/role_widget.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              'Choose your role',
              style: getHeadLineLarge(),
            ),
            const SizedBox(
              height: 20,
            ),
            roleWidget(
                borderColor: ColorManager.purple,
                tap: () {
                  Navigator.pushNamed(context, 'signup_user');
                },
                image: AssetsManager.student3Role,
                description:
                    'you can find what you need of courses and with best quality',
                title: 'Student'),
            const SizedBox(height: 20),
            roleWidget(
              title: 'Teacher',
              tap: () {
                Navigator.pushNamed(context, AppRoute.signUpTeacher);
              },
              description:
                  ' that mean you can add your courses and accsess to more student',
              image: AssetsManager.teacher3Role,
              borderColor: ColorManager.orange,
            ),
          ]),
        ]),
      ),
    );
  }
}
