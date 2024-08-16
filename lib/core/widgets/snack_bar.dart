import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class SnackBarMessage {
  final String message;
  Color? color;
  SnackBarMessage({required this.message, this.color});

  SnackBar buildSnackBar(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        style: getBodyMeduimOrSmall(
          isMeduim: true,
          color: color ?? ColorManager.redBright,
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r4), // Circular edges
      ),
      elevation: 4,
      duration: const Duration(seconds: 1),
    );
  }
}
