import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/auth/login/login_model.dart';
import 'package:learning_system/src/features/user/cubit/user_states.dart';
import 'package:flutter/material.dart';

class UserCubit extends Cubit<UserStates> {
  final ApiConsumer api;
  UserCubit({required this.api}) : super(UserInitial());
  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  LoginModel? user;
  login() async {
    try {
      log('email : ' + signInEmail.text);
      log('password : ' + signInPassword.text);
      emit(SignInLoading());
      final response = await api.post(
        AppUrl.loginUser,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );

      user = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      getIt<CacheHelper>().saveData(key: AppString.token, value: user!.token);
      getIt<CacheHelper>().saveData(
          key: AppString.userIdCacheKey,
          value: decodedToken[AppString.decodeTokenForId]);
      getIt<CacheHelper>().saveData(
          key: AppString.roleCacheKey,
          value: decodedToken[AppString.decodeTokenForRole]);

      log("role is :" + decodedToken[AppString.decodeTokenForRole]);
      log("user id : ${decodedToken[AppString.decodeTokenForId]}");

      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.message!));
      log('--------------------------in catch--------------------');
    }
  }
}
