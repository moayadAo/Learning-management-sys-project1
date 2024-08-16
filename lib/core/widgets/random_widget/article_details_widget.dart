import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/sliver_app_bar/sliver_app_bar.dart';
import 'package:readmore/readmore.dart';

class ArticleDetailsWidget extends StatelessWidget {
  const ArticleDetailsWidget({super.key,required this.titleOfArticle,required this.nameOfTeacher,required this.description});
  final String titleOfArticle ;
  final String nameOfTeacher;
  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBarWidget(
          text: "Article Info ",
          background: Container(
            decoration:const  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/article.png"),
                    fit: BoxFit.fill)),
          ),
          expandedHeight: AppSize.s280,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: titleOfArticle,
                            style: getSemiBoldStyle(
                                fontSize: FontSize.s22,
                                color: ColorManager.black),
                          ),
                        ),
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        RichText(
                          text: TextSpan(
                            text: nameOfTeacher,
                            style: getTitleMeduim(
                                fontSize: FontSize.s14,
                                color: ColorManager.grayLight),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppPadding.p16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "About this Article",
                        style: getBoldStyle(
                            fontSize: FontSize.s22,
                            color: ColorManager.black),
                      ),
                    ),
                    const SizedBox(
                      height: AppPadding.p8,
                    ),
                    ReadMoreText(
                      description,
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      lessStyle:
                      getMoreOrLess(color: ColorManager.redBright),
                      moreStyle: getMoreOrLess(
                          color: ColorManager.SecondaryColorLogo),
                      style: getTitleMeduim(
                          fontSize: FontSize.s12,
                          color: ColorManager.grayLight),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
