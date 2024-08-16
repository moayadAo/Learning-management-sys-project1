import 'package:flutter/material.dart';
import 'package:learning_system/src/features/auth/login/view/login.dart';
import 'package:learning_system/src/features/auth/signup/view/choose_role.dart';
import 'package:learning_system/src/features/auth/signup/view/sign_up_page_user.dart';
import 'package:learning_system/src/features/auth/splash_page/view/splash_page.dart';
import 'package:learning_system/src/features/auth/welcome/welcome.dart';
import 'package:learning_system/src/features/course/presentation/article_screens/create_article_page.dart';
import 'package:learning_system/src/features/course/presentation/article_screens/update_article.dart';
import 'package:learning_system/src/features/course/presentation/course/create_course.dart';
import 'package:learning_system/src/features/course/presentation/course_page.dart';
import 'package:learning_system/src/features/course/presentation/video_screens/update_video.dart';

import 'package:learning_system/src/features/quiz/presentation/create_quize.dart';
import 'package:learning_system/src/features/quiz/presentation/quiz_sccreen.dart';
import 'package:learning_system/src/features/quiz/presentation/quiz_welcome.dart';

import 'package:learning_system/src/features/course/presentation/video_screens/create_video_page.dart';

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
      initialRoute: 'create_quiz_page', // Start from splash page
      routes: {
        'splash': (context) => const SplashPage(),
        'welcome': (context) => WelcomePage(),
        'signup_user': (context) => SignUpScreenUser(),
        'login': (context) => LoginPage(),
        'role': (context) => const ChooseRoleScreen(),
        'profile': (context) => const ProfileUser(),
        'progress_course': (context) => ProgressPage(),
        'finish_course': (context) => FinishPage(),
        'wish_list_page': (context) => WishListPage(),
        'enroll_course': (context) => EnrollPage(),
        'course_page': (context) => const CoursePage(),
        'create_video_page': (context) => CreateVideoPage(),
        'create_article_page': (context) => CreateArticlePage(),
        'update_article_page': (context) => UpdateArticlePage(),
        'update_video_page': (context) => UpdateVideoPage(),
        'create_course_page': (context) => CreateCoursePage(),
        'create_quiz_page': (context) => CreateQuiz(),
        // Add any additional routes here
      },
    );
  }
}
