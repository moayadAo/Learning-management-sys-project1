import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class LoadingIndicator extends StatelessWidget {
  double? height;
  double? width;
  Color? backgroundColor;
  Color? color;

  LoadingIndicator(
      {super.key, this.height, this.width, this.color, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: height ?? AppSize.s30,
          width: width ?? AppSize.s30,
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor ?? ColorManager.SecondaryColorLogo,
            valueColor:
                AlwaysStoppedAnimation(color ?? ColorManager.primaryColorLogo),
          )),
    );
  }
}
