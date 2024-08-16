import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String imageUrl;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: CircleAvatar(
          radius: AppSize.s30,
          backgroundColor: ColorManager.mediumViolet,
          child: ClipOval(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,  // Ensures the image covers the entire circle
              width: AppSize.s200, // The width and height of the CircleAvatar should match
              height: AppSize.s200, // its radius * 2 to avoid any distortion
            ),
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: title,
            style: getBoldStyle(
              fontSize: FontSize.s16,
              color: ColorManager.black,
            ),
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            text: subTitle,
            style: getRegularStyle(
              fontSize: FontSize.s16,
              color: ColorManager.black,
            ),
          ),
        ),
      ),
    );
  }
}
