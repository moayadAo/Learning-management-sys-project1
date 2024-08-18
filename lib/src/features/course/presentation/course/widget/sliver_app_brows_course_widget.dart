import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/new_search/search_textfield.dart';

class SliverAppBrowsCourseWidget extends StatelessWidget {
  SliverAppBrowsCourseWidget(
      {super.key, required this.text, this.iconClosePressed, this.onChanged});
  void Function(String)? onChanged;
  void Function()? iconClosePressed;
  String? text;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        color: ColorManager.white,
        icon: IconManager.arrowLeft,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: ColorManager.primaryColorLogo,
      expandedHeight: AppSize.s160,
      floating: true,
      pinned: true,
      snap: false,
      title: RichText(
        text: TextSpan(
          text: text,
          style: getBoldStyle(fontSize: 25, color: ColorManager.white),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          Positioned(
            top: AppPadding.p100,
            left: AppPadding.p16,
            right: AppPadding.p16,
            child: SearchTextField(
              onChanged: onChanged ?? (String) {},
              iconClosePressed: iconClosePressed ?? () {},
            ),
          ),
        ]),
      ),
    );
  }
}
