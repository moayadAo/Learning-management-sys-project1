import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/api/dio_consumer.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/src/app.dart';
import 'package:learning_system/src/features/user/cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(BlocProvider(
      create: (context) => UserCubit(api: DioConsumer(dio: Dio())),
      child: const EduBridgeApp()));
}
