import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/api/dio_consumer.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/firebase_options.dart';
import 'package:learning_system/my_firebase.dart';
import 'package:learning_system/src/app.dart';
import 'package:learning_system/src/features/article/cubit/pdf_cubit.dart';
import 'package:learning_system/src/features/course/cubit/article/article_cubit.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/presentation/follow_course/cubit/follow_course_cubit.dart';

import 'package:learning_system/src/features/quiz/cubit/answer/answer_cubit.dart';

import 'package:learning_system/src/features/course/cubit/rate/rating_cubit.dart';
import 'package:learning_system/src/features/course/cubit/video/video_cubit.dart';
import 'package:learning_system/src/features/quiz/cubit/quiz/cubit_quiz.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit_2.dart';

import 'package:learning_system/src/features/user/cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FireNotificationConfig().notificationConfig();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(
        create: (_) => UserCubit(api: DioConsumer(dio: Dio())),
      ),
      BlocProvider<RatingCubit>(
        create: (_) => RatingCubit(),
      ),
      BlocProvider<QuizCubit>(
        create: (_) => QuizCubit(api: DioConsumer(dio: Dio())),
      ),
      BlocProvider<AnswerCubit>(create: (_) => AnswerCubit()),
      BlocProvider<VideoCubit>(
        create: (_) => VideoCubit(api: DioConsumer(dio: Dio())),
      ),
      BlocProvider<FollowCourseCubit>(
        create: (_) => FollowCourseCubit(),
      ),
      BlocProvider<CourseCubit>(
        create: (_) => CourseCubit(api: DioConsumer(dio: Dio())),
      ),
      BlocProvider<FileViewCubit>(
        create: (_) => FileViewCubit(),
      ),
      BlocProvider<TeacherCubit2>(
        create: (_) => TeacherCubit2(api: DioConsumer(dio: Dio())),
      ),
      BlocProvider<ArticleCubit>(
        create: (_) => ArticleCubit(api: DioConsumer(dio: Dio())),
      )
    ],
    child: const EduBridgeApp(),
  ));
}
