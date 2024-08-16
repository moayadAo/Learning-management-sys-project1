import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.text,
      required this.onPressed});
  final double width;
  final double height;
  final Color color;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height:height,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          foregroundColor: ColorManager.black,
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p6), // Text and icon color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6), // Rounded corners
          ),
          elevation: 5, // Elevation for shadow effect
        ),
        onPressed: onPressed,
        child:   RichText(
          text: TextSpan(
            text:text,
            style: getTitleMeduim(
                fontSize: AppSize.s16,
                color: ColorManager.white),
          ),
        ),
      ),
    );
  }
}
