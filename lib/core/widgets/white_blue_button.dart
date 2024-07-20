import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class WhiteBlueButton extends StatelessWidget {
  const WhiteBlueButton(
      {super.key,
      this.onPressed,
      required this.height,
      required this.width,
      required this.label,
      required this.isBlue});

  final VoidCallback? onPressed;
  final String label;
  final bool isBlue;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: isBlue ? ColorManager.primary : ColorManager.white,
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r10)),
          side: isBlue
              ? BorderSide.none
              : const BorderSide(color: ColorManager.primary, width: 1)),
      child: Text(
        label,
        style: getLabelSmall(
          fontSize: FontSize.s16,
          color: isBlue ? ColorManager.white : ColorManager.primary,
        ),
      ),
    );
  }
}
