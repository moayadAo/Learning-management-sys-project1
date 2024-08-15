

import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';

import '../../utils/values_manager.dart';


class CustomButton extends StatelessWidget {
  final void Function() onPressed ;
  final String text;
Color color;
  CustomButton({super.key,required this.onPressed, required this.text,required this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s280+40,
      height:AppSize.s60,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          foregroundColor: ColorManager.black,
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p12), // Text and icon color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
          ),
          elevation: 5, // Elevation for shadow effect
        ),
        onPressed: onPressed,
        child:   RichText(
          text: TextSpan(
            text:text,
            style: getTitleMeduim(
                fontSize: AppSize.s20,
                color: ColorManager.white),
          ),
        ),
      ),
    );
  }
}
