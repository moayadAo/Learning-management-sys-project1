import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/snack_bar.dart';
import 'package:learning_system/src/features/user/cubit/user_cubit.dart';
import 'package:learning_system/src/features/user/cubit/user_states.dart';
import '../../../../../core/helper/sizer_media_query.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/validator_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/widgets/textfield_app.dart';
import '../../../../../core/widgets/textfield_with_label.dart';
// import '../../../core/presentation/cubits/user_cubit/user_cubit.dart';
// import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarMessage(message: 'userName or password wrong!')
                  .buildSnackBar(context));
        } else if (state is SignInSuccess) {
          // here should move to profile page and hit api get user
          log('log in succesful');
          context.read<UserCubit>().getUser();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p14),
                        child: Image.asset(
                          AssetsManager.logoIMGWithoutBackgroundHighResolution,
                          width: getWidth(context) / 3,
                          height: getHeight(context) / 3,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Text(
                        'welcome to',
                        textAlign: TextAlign.center,
                        style: getBodyMeduimOrSmall(isMeduim: true),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Text(
                        'Edu Bridge',
                        textAlign: TextAlign.center,
                        style: getBodyLargeStyle(
                          fontSize: 28,
                          color: ColorManager.SecondaryColorLogo,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12),
                        child: TextFiledApp(
                          validator: (value) =>
                              ValidatorManager().validateEmail(value!),
                          controller: emailController,
                          hintText: 'Enter Your Email',
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12),
                        child: TextFiledApp(
                          validator: (value) => ValidatorManager.instance
                              .validatePassword(value!),
                          controller: passwordController,
                          obscureText: true,
                          suffixIcon: true,
                          hintText: 'Enter Your Password',
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: StatefulBuilder(
                                builder: (context, setStateCheckBox) {
                              return InkWell(
                                onTap: () {
                                  setStateCheckBox(() {
                                    rememberMe = !rememberMe;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p12),
                                  child: Row(
                                    children: [
                                      Icon(
                                        rememberMe
                                            ? Icons.check_box
                                            : Icons.check_box_outline_blank,
                                        color: ColorManager.primaryColorLogo,
                                      ),
                                      Text(
                                        'Remember me',
                                        style: getBodyMeduimOrSmall(
                                            isMeduim: false,
                                            color: ColorManager.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                          // Expanded(
                          //   child: TextButton(
                          //     onPressed: () {
                          //       ///Code here
                          //     },
                          //     child: Text(
                          //       'Forgot Your Password ? ',
                          //       style: getBodyMeduimOrSmall(isMeduim: false),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      state is SignInLoading
                          ? LoadingIndicator()
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p12),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorManager.primaryColorLogo,
                                    minimumSize: const Size(
                                        double.infinity, AppSize.s50)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<UserCubit>(context)
                                        .signInEmail
                                        .text = emailController.text;
                                    BlocProvider.of<UserCubit>(context)
                                        .signInPassword
                                        .text = passwordController.text;
                                    BlocProvider.of<UserCubit>(context).login();
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style:
                                      getLabelSmall(color: ColorManager.white),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Text(
                        'Not a Member ? ',
                        textAlign: TextAlign.center,
                        style: getBodyMeduimOrSmall(
                            isMeduim: false, color: ColorManager.red),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'role');
                          },
                          child: Text(
                            'Signup',
                            textAlign: TextAlign.center,
                            style: getTitleMeduim(
                                fontSize: 20,
                                color: ColorManager.SecondaryColorLogo),
                            // style: TextStyle(
                            //   fontSize: 20,
                            //   decoration: TextDecoration.underline,
                            //   fontWeight: FontWeight.w500,
                            //   color: ColorManager.secondary,
                            // ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
