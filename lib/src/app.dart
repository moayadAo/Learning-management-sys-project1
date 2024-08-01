import 'package:flutter/material.dart';
import 'package:learning_system/src/features/auth/welcome/welcome.dart';
import 'package:learning_system/src/features/user/prsentation/profile_user.dart';

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
