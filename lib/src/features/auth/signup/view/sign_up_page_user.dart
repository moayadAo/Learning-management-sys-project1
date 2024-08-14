import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/core/widgets/textfield_with_label.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_system/src/features/auth/login/view/login.dart';
import 'package:learning_system/src/features/user/cubit/user_cubit.dart';
import 'package:learning_system/src/features/user/cubit/user_states.dart';

// class SignUpScreenUser extends StatefulWidget {
//   SignUpScreenUser({super.key});

//   @override
//   State<SignUpScreenUser> createState() => _SignUpScreenState();
// }

class SignUpScreenUser extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  // final birthdateController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  final TextEditingController _Datecontroller = TextEditingController();

  final DateFormat _dateFormat = DateFormat('dd/MM/yy');

  XFile? _imagePick;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickerFromGallery(
      BuildContext context, Function setState) async {
    final _imageGallery = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (_imageGallery != null) {
      // setState(() {
      _imagePick = XFile(_imageGallery.path);
      context.read<UserCubit>().uploadProfilePic(_imagePick);

      Navigator.pop(context);
      // });
      log('${_imageGallery.path}');
    }
  }

  Future<void> _pickerFromCamera(
      BuildContext context, Function setState) async {
    final _imageCamera = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (_imageCamera != null) {
      // setState(() {
      _imagePick = XFile(_imageCamera.path);
      context.read<UserCubit>().uploadProfilePic(_imagePick);
      // });
      Navigator.pop(context);
      log('${_imageCamera.path}');
    }
  }

  void _deletePicker(BuildContext context, Function setState) {
    // setState(() {
    _imagePick = null;
    context.read<UserCubit>().uploadProfilePic(_imagePick);
    // });
    Navigator.pop(context);
  }

  // register() async {
  //   await context.read<UserCubit>().register(
  //         context,
  //         email: emailController.value.text,
  //         password: passwordController.value.text,
  //         firstName: firstNameController.value.text,
  //         lastName: lastNameController.value.text,
  //         image: _imagePick?.path ?? '',
  //       );
  // }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _Datecontroller.text = _dateFormat.format(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) async {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        } else if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Sign Up Success'),
            duration: Duration(seconds: 2),
          ));
          await Future.delayed(const Duration(seconds: 1));
          Navigator.pushNamed(
            context,
            'login',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getHeight(context) * 0.2,
                          width: double.infinity,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 25, bottom: 25),
                          decoration: const BoxDecoration(
                              color: Color(0xffF0F0F2),
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15))),
                          child: Text(
                            'Sign Up',
                            style: getHeadLineLarge(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Already have an account ? ',
                                style: getBodyMeduimOrSmall(isMeduim: false),
                                children: [
                                  TextSpan(
                                    text: 'Log in',
                                    style: getLabelSmall(),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()),
                                            (Route<dynamic> route) => false);
                                      },
                                  )
                                ])),
                        const SizedBox(height: 20),
                        // add image
                        StatefulBuilder(
                          builder: (context, setStatePicker) {
                            return Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.hardEdge,
                              children: [
                                AnimatedContainer(
                                  clipBehavior: Clip.hardEdge,
                                  duration: const Duration(milliseconds: 300),
                                  width: getWidth(context) * 0.3,
                                  height: getWidth(context) * 0.3,
                                  decoration: BoxDecoration(
                                    color: ColorManager.primaryColorLogo,
                                    shape: BoxShape.circle,
                                    border: _imagePick != null
                                        ? Border.all(
                                            color: ColorManager.secondary,
                                            width: AppSize.s4)
                                        : null,
                                  ),
                                  child: _imagePick == null
                                      ? Icon(
                                          Icons.person,
                                          size: getWidth(context) * 0.2,
                                        )
                                      : ClipOval(
                                          child: Image.file(
                                            File(_imagePick!.path),
                                            width: getWidth(context) * 0.3,
                                            height: getWidth(context) * 0.3,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                ),
                                Positioned(
                                  right: getWidth(context) / 3.25,
                                  bottom: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(AppSize.s24),
                                          ),
                                        ),
                                        builder: (_) => Padding(
                                          padding: const EdgeInsets.only(
                                              top: AppPadding.p12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 76,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                              ),
                                              const SizedBox(
                                                  height: AppSize.s10),
                                              SizedBox(
                                                height: getWidth(context) / 2.5,
                                                child: Column(
                                                  children: [
                                                    _buildImagePicker(
                                                      title:
                                                          'Pick From Gallery',
                                                      icon: Icons.image,
                                                      onTap: () =>
                                                          _pickerFromGallery(
                                                              context,
                                                              setStatePicker),
                                                    ),
                                                    divider(
                                                        indent:
                                                            getWidth(context) /
                                                                AppSize.s6),
                                                    _buildImagePicker(
                                                      title: 'Pick From Camera',
                                                      icon: Icons.camera_alt,
                                                      onTap: () =>
                                                          _pickerFromCamera(
                                                              context,
                                                              setStatePicker),
                                                    ),
                                                    divider(
                                                        indent:
                                                            getWidth(context) /
                                                                AppSize.s6),
                                                    _buildImagePicker(
                                                      title: 'Delete Photo',
                                                      icon: Icons.delete,
                                                      onTap: () =>
                                                          _deletePicker(context,
                                                              setStatePicker),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: CircleAvatar(
                                      backgroundColor: ColorManager.white,
                                      child: Icon(
                                        Icons.add_a_photo,
                                        size: getWidth(context) * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        TextFieldWithLabel(
                          textColor: ColorManager.primary,
                          label: 'First name',
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: TextFiledApp(
                            controller: firstNameController,
                            validator: (value) =>
                                ValidatorManager().validateName(value!),
                          ),
                        ),
                        // CustomTextFormField(
                        //     title: 'First name',
                        //     validate: (value) {},
                        //     wantObscure: false,
                        //     controller: controller),
                        const SizedBox(height: 20),
                        TextFieldWithLabel(
                          textColor: ColorManager.primary,
                          label: 'Last name',
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: TextFiledApp(
                            controller: lastNameController,
                            validator: (value) =>
                                ValidatorManager().validateName(value!),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithLabel(
                          textColor: ColorManager.primary,
                          label: 'Email',
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: TextFiledApp(
                            controller: emailController,
                            validator: (value) =>
                                ValidatorManager().validateEmail(value!),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithLabel(
                          textColor: ColorManager.primary,
                          label: 'Password',
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: TextFiledApp(
                            controller: passwordController,
                            validator: (value) =>
                                ValidatorManager().validatePassword(value!),
                            obscureText: true,
                            wantObscure: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithLabel(
                          textColor: ColorManager.primary,
                          label: 'Confirm Password',
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: TextFiledApp(
                            controller: confirmController,
                            validator: (value) => ValidatorManager()
                                .validateConfirmPassword(
                                    value!, passwordController.text),
                            obscureText: true,
                            wantObscure: true,
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextFieldWithLabel(
                          textColor: ColorManager.primary,
                          label: 'Birth Date',
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p14),
                          child: TextFiledApp(
                            controller: _Datecontroller,
                            readOnly: true,
                            hintText: "DD/MM/YY",
                            onTap: () => _selectDate(context),
                            validator: (value) =>
                                ValidatorManager().validateName(value!),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p12),
                          child: state is SignUpLoading
                              ? LoadingIndicator()
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ColorManager.primaryColorLogo,
                                      minimumSize: const Size(
                                          double.infinity, AppSize.s50)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<UserCubit>()
                                          .setSignupPrameters(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              firstName:
                                                  firstNameController.text,
                                              lastName: lastNameController.text,
                                              birthdate: _Datecontroller.text,
                                              image: _imagePick);
                                      context.read<UserCubit>().signup();
                                    }
                                  },
                                  child: Text(
                                    'SignUp',
                                    style: getLabelSmall(
                                        color: ColorManager.white),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )),
              ),
            ));
      },
    );
  }

  Widget _buildImagePicker(
      {required String title,
      required IconData icon,
      required void Function()? onTap}) {
    return Expanded(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        dense: true,
        splashColor: ColorManager.secondary,
        style: ListTileStyle.list,
      ),
    );
  }
}
