import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:learning_system/core/api/api_consumer.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/errors/exceptions.dart';
import 'package:learning_system/core/helper/upload_image_to_api.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/src/features/auth/login/login_model.dart';
import 'package:learning_system/src/features/auth/signup/model/signup_model.dart';
import 'package:learning_system/src/features/user/cubit/user_states.dart';
import 'package:flutter/material.dart';
import 'package:learning_system/src/features/user/data/models/data_user_model.dart';

class UserCubit extends Cubit<UserStates> {
  final ApiConsumer api;
  DataUserModel? userModel;
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
  //Sign up first name
  TextEditingController signUpfirstName = TextEditingController();
  //Sign up last name
  TextEditingController signUplastName = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up birthDate
  TextEditingController signUpBirthDate = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  LoginModel? user;

  uploadProfilePic(XFile? image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  login() async {
    try {
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

      emit(SignInSuccess());
      getUser();
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.message!));
    }
  }

  setSignupPrameters({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthdate,
    XFile? image,
  }) {
    signUpEmail.text = email;
    signUpPassword.text = password;
    signUpfirstName.text = firstName;
    signUplastName.text = lastName;
    signUpBirthDate.text = birthdate;
    profilePic = image;
  }

  signup() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(AppUrl.register, isFormData: true, data: {
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.firstName: signUpfirstName.text,
        ApiKey.lastName: signUplastName.text,
        ApiKey.birthDate: signUpBirthDate.text,
        ApiKey.image:
            profilePic != null ? await uploadImageToApi(profilePic!) : '',
        ApiKey.role: 'user',
      });
      final signupModel = SignupModel.fromJson(response);
      emit(SignUpSuccess(message: signupModel.status));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.message!));
    }
  }

  getUser() async {
    try {
      emit(GetUserLoading());
      final response = await api.getApi(AppUrl.getProfile);
      userModel = SignupModel.fromJson(response).data;
      emit(GetUserSuccess());
      log('-------------------------------------------------image ${userModel!.image}');
    } on ServerException catch (e) {
      emit(GetUserFailure(errMessage: e.errorModel.message!));
    }
  }
}
