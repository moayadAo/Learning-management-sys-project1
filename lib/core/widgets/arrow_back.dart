import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';

class ArrowBack extends StatelessWidget {
  ArrowBack({super.key, this.color});
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8.0,
      left: 8.0,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: color ?? ColorManager.blackColorLogo,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
