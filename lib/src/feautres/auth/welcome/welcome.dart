import 'package:flutter/material.dart';
import 'package:learning_system/src/feautres/auth/welcome/cubit/welcome_cubit.dart';
import 'package:learning_system/src/feautres/auth/welcome/cubit/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/src/feautres/auth/welcome/view/page_one.dart';
import 'package:learning_system/src/feautres/auth/welcome/view/page_second.dart';
import 'package:learning_system/src/feautres/auth/welcome/view/page_three.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeCubit(),
      child: PageView(
        controller: controller,
        onPageChanged: (int index) {},
        children: [
          WelcomePageOne(controller: controller),
          WelcomePageTwo(controller: controller),
          WelcomePageThree(controller: controller),
        ],
      ),
    );
  }
}
