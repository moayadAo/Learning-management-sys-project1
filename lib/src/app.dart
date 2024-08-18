import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/src/features/article/presentation/article_page.dart';
import 'package:learning_system/src/features/course/presentation/course/browse_course_screen.dart';
import 'package:learning_system/src/features/course/presentation/course/course_detail.dart';
import 'package:learning_system/src/features/institute/presentation/add_scholarships_page/add_scholarships_page.dart';
import 'package:learning_system/src/features/institute/presentation/institute_page.dart';
import 'package:learning_system/src/features/institute/presentation/institution_students/institution_students_page.dart';
import 'package:learning_system/src/features/institute/presentation/pay_students/pay_student_page.dart';
import 'package:learning_system/src/features/institute/presentation/scholarship_students/scholarship_students_page.dart';
import 'package:learning_system/src/features/institute/presentation/scholarships_requests/scholarships_requests_page.dart';
import 'package:learning_system/src/features/institute/presentation/teachers_request/teacher_request.dart';
import 'package:learning_system/src/features/article/presentation/article_details.dart';
import 'package:learning_system/src/features/auth/login/view/login.dart';
import 'package:learning_system/src/features/auth/signup/view/choose_role.dart';
import 'package:learning_system/src/features/auth/signup/view/sign_up_page_user.dart';
import 'package:learning_system/src/features/auth/splash_page/view/splash_page.dart';
import 'package:learning_system/src/features/auth/welcome/welcome.dart';
import 'package:learning_system/src/features/course/presentation/article_screens/create_article_page.dart';
import 'package:learning_system/src/features/course/presentation/article_screens/update_article.dart';
import 'package:learning_system/src/features/course/presentation/course/create_course.dart';
import 'package:learning_system/src/features/course/presentation/video_screens/update_video.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/follow_course.dart';

import 'package:learning_system/src/features/quiz/presentation/create_quize.dart';
import 'package:learning_system/src/features/quiz/presentation/quiz_sccreen.dart';
import 'package:learning_system/src/features/quiz/presentation/quiz_welcome.dart';

import 'package:learning_system/src/features/teacher/presentation/edit_info/edit_info_teacher.dart';
import 'package:learning_system/src/features/teacher/presentation/get_all_teacher_screen.dart';
import 'package:learning_system/src/features/teacher/presentation/messages_teacher.dart';

import 'package:learning_system/src/features/course/presentation/video_screens/create_video_page.dart';
import 'package:learning_system/src/features/teacher/presentation/sign_up/sign_up_teacher_page.dart';
import 'package:learning_system/src/features/user/presentation/course_page.dart';

import 'package:learning_system/src/features/user/presentation/profile_user.dart';

class EduBridgeApp extends StatelessWidget {
  const EduBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: 'splash', // Start from splash page
      // You mentioned to start from scholarshipsPage but the initial route is set to 'AppRoute.scholarshipsPage' which should be a string if it refers to the name.

      routes: {
        'splash': (context) => const SplashPage(),
        'welcome': (context) => WelcomePage(),
        'signup_user': (context) => SignUpScreenUser(),
        'login': (context) => LoginPage(),
        'role': (context) => const ChooseRoleScreen(),
        'profile': (context) => const ProfileUser(),

        ///*****************************Course
        'course_page': (context) => const CoursePage(),
        'create_video_page': (context) => CreateVideoPage(),
        'follow_course_page': (context) => const FollowCoursePage(),
        'browse_course_page': (context) => BrowseCourseScreen(),
        'course_detail': (context) => const CourseDetailPage(),

        ///********************************Quiz
        'welcome_quiz': (context) => const QuizWelcome(),
        'quiz_screen': (context) => const QuizScreen(),

        ///********************************Article
        'article_details': (context) => const ArticleDetails(),

        ///**********************************teacher
        // 'teacher_profile': (context) => const TeacherProfile(),
        // 'teacher_cv': (context) => const TeacherCv(),
        'messagesTeacher': (context) => const MessagesTeacher(),
        'getAllTeacherScreen': (context) => const GetAllTeacherScreen(),

        'update_article_page': (context) => UpdateArticlePage(),
        'update_video_page': (context) => UpdateVideoPage(),
        'create_course_page': (context) => CreateCoursePage(),
        'create_quiz_page': (context) => CreateQuiz(),

        // Add any additional routes here
        'create_article_page': (context) => CreateArticlePage(),

        ///********************************Institute
        'institute_page': (context) => const InstitutePage(),
        'scholarshipStudentsPage': (context) => const ScholarshipStudentsPage(),
        'institutionStudentsPage': (context) => const InstitutionStudentsPage(),
        'payStudentPage': (context) => const PayStudentPage(),
        'scholarshipsRequestsPage': (context) =>
            const ScholarshipsRequestsPage(),
        'teacherRequest': (context) => const TeacherRequest(),
        'addScholarshipsPage': (context) => AddScholarshipsPage(),
        // 'scholarshipsPage': (context) => ScholarshipsPage(),

        'editInfoTeacher': (context) => EditInfoTeacher(),
        'file_view_widget': (context) => FileViewWidget(),
        'sign_up_teacher': (context) => SignUpScreenTeacher(),
      },
    );
  }
}
