

import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';

import '../../utils/values_manager.dart';


class CustomButton extends StatelessWidget {
  final void Function() onPressed ;
  final String text;

  CustomButton({super.key,required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s240,
      height:AppSize.s60,
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          foregroundColor: ColorManager.black,
          backgroundColor: ColorManager.SecondaryColorLogo,
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p12), // Text and icon color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
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
