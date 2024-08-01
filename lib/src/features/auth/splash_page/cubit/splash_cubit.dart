import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/src/features/auth/splash_page/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInit());

  Future<void> _loadSplash(BuildContext context) async {
    emit(SplashLoading());
    // to initlize the storage and to sure the user is has token and to push to home page
    //AppStorage.instance.init();
    //await BlocProvider.of<UserCubit>(context).getProfile(context);
    // await Future.delayed( const Duration(seconds: 5), () {
    //   goRouter.pushReplacementNamed(AppRoute.navbar.name);
    // });
  }

  Future<void> _initSplash(BuildContext context) async {
    emit(SplashInit());
    // await AppStorage.instance.init();
    // await initDataConfiguration();
  }

  Future<void> initSplash(BuildContext context) async {
    await _initSplash(context);
    await _loadSplash(context);
  }
}
