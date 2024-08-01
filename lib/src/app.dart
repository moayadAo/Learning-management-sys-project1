import 'package:flutter/material.dart';

import 'package:learning_system/src/features/auth/login/login.dart';
import 'package:learning_system/src/features/auth/signup/view/choose_role.dart';
import 'package:learning_system/src/features/auth/signup/view/sign_up_page_user.dart';
import 'package:learning_system/src/features/auth/splash_page/view/splash_page.dart';

import 'package:learning_system/src/features/auth/welcome/welcome.dart';
import 'package:learning_system/src/features/user/prsentation/profile_user.dart';

import 'package:learning_system/src/features/user/presentation/profile.dart';
//import 'package:learning_system/src/feautres/auth/welcome/welcome.dart';

class EduBridgeApp extends StatelessWidget {
  const EduBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: ProfileUser(),

    );
  }
}
