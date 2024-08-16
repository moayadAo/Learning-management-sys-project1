import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/list_tile_widget/list_tile_widget.dart';

class InstitutionStudentsPage extends StatelessWidget {
  const InstitutionStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor :ColorManager.white,
            backgroundColor: ColorManager.SecondaryColorLogo,
            title: RichText(
              text: TextSpan(
                text: "Institution students",
                style: getSemiBoldStyle(
                    fontSize: FontSize.s24, color: ColorManager.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12, vertical: AppPadding.p8),
                  child: ListTileWidget(
                    imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJxo2NFiYcR35GzCk5T3nxA7rGlSsXvIfJwg&s",
                    title: "title",
                    subTitle: "subTitle",
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.profileScreen);
                    },
                    decade: '18/8/2020 ',
                  ));
            }, childCount: 8),
          ),
        ],
      ),
    );
  }
}
