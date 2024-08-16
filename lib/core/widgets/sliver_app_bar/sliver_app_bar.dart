import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key,this.text,this.background,this.expandedHeight,this.actions});
  final String? text;
  final Widget? background;
  final double? expandedHeight;
  final List<Widget>? actions;
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
      backgroundColor: ColorManager.SecondaryColorLogo,
      expandedHeight:expandedHeight,
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
          background: background
      ),
      actions:actions,
    );
  }
}
