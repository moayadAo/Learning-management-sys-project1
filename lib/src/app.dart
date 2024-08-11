import 'package:flutter/material.dart';
import 'package:learning_system/src/features/auth/login/login.dart';
import 'package:learning_system/src/features/auth/signup/view/choose_role.dart';
import 'package:learning_system/src/features/auth/signup/view/sign_up_page_user.dart';
import 'package:learning_system/src/features/auth/splash_page/view/splash_page.dart';
import 'package:learning_system/src/features/auth/welcome/welcome.dart';
import 'package:learning_system/src/features/course/presentation/course_page.dart';
import 'package:learning_system/src/features/user/presentation/enroll_page.dart';
import 'package:learning_system/src/features/user/presentation/finish_page.dart';
import 'package:learning_system/src/features/user/presentation/profile_user.dart';
import 'package:learning_system/src/features/user/presentation/progress_page.dart';
import 'package:learning_system/src/features/user/presentation/wish_list_page.dart';


class EduBridgeApp extends StatelessWidget {
  const EduBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      initialRoute: 'profile',
      routes: {
        'profile' : (context) => ProfileUser(),
        'progress_course' : (context)=>ProgressPage(),
        'finish_course' :(context)=> FinishPage(),
        'wish_list_page' :(context)=>WishListPage(),
        'enroll_course' : (context)=> EnrollPage(),
        'course_page' : (context)=> CoursePage(),
   /*     'home_page':(context)=>HomePage(),
        'pages_move':(context)=>HomeScreen(),
        'courseVideoPage':(context)=>CourseVideoPage(),*/

        'welcome': (context) => WelcomePage(),
        'signup user': (context) => SignUpScreenUser(),
        'login': (context) => LoginPage(),
        'role': (context) => const chooseRoleScreen(),

      },
    );
  }
}

