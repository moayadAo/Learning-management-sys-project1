import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:learning_system/src/features/auth/welcome/welcome.dart';
import 'package:learning_system/src/features/user/prsentation/profile_user.dart';
=======
import 'package:learning_system/src/features/user/presentation/profile.dart';
//import 'package:learning_system/src/feautres/auth/welcome/welcome.dart';
>>>>>>> Stashed changes

class EduBridgeApp extends StatelessWidget {
  const EduBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< Updated upstream
      home: ProfileUser(),
=======
      home: ProfileUserPage()
>>>>>>> Stashed changes
    );
  }
}
