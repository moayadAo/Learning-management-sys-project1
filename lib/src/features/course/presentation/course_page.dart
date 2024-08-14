import 'package:flutter/material.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';

import 'package:learning_system/core/widgets/sliver_app_bar/sliver_app_bar.dart';
import 'package:learning_system/src/features/course/presentation/rating_widget.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';


class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(
            text: "Course Info ",
            background: Container(
                //color: ColorManager.SecondaryColorLogo,
                ),
            expandedHeight: AppSize.s200,
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
                              text: "Programming ",
                              style: getSemiBoldStyle(
                                  fontSize: 20, color: ColorManager.black),
                            ),
                          ),
                          const SizedBox(
                            height: AppPadding.p8,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "duration",
                              style: getTitleMeduim(
                                  fontSize: AppSize.s14,
                                  color: ColorManager.grayLight),
                            ),
                          ),
                        ],
                      ),
                      RichText(
                          text: TextSpan(
                        text: "\$150",
                        style: getHeadLineLarge(
                          fontSize: AppSize.s20,
                          color: ColorManager.SecondaryColorLogo,
                        ),
                      )),
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
                          text: "About this course",
                          style: getBoldStyle(
                              fontSize: AppSize.s18, color: ColorManager.black),
                        ),
                      ),
                      const SizedBox(
                        height: AppPadding.p8,
                      ),
                      ReadMoreText(
                        'This provides a basic structure for your course screen using Flutter Cubit and SliverAppBar. You can expand on it based on your specific requirements and design preferences.',
                        trimMode: TrimMode.Line,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        lessStyle: getMoreOrLess(color: ColorManager.redBright),
                        moreStyle: getMoreOrLess(
                            color: ColorManager.SecondaryColorLogo),
                        style: getTitleMeduim(
                            fontSize: AppSize.s10,
                            color: ColorManager.grayLight),
                      ),
                      const SizedBox(
                        height: AppPadding.p8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "What you'll learn ",
                          style: getBoldStyle(
                              fontSize: AppSize.s18, color: ColorManager.black),
                        ),
                      ),
                      const SizedBox(
                        height: AppPadding.p8,
                      ),
                      ReadMoreText(
                          'You will learn graphic design concepts like layout, typography, visual hierarchy, design tricks, and more.\n\n'
                          'You will learn how to design beautiful websites using Figma, an interface design tool used by designers at Uber, Airbnb and Microsoft.\n\n'
                          'You will learn how to take the designs and build them into websites using Webflow — a powerful site builder used by teams at Adobe, Dell, NASA and more.\n\n'
                          'You will learn secret tips of freelance web designers and how they make great money freelancing online.',
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: getMoreOrLess(
                              color: ColorManager.SecondaryColorLogo),
                          lessStyle:
                              getMoreOrLess(color: ColorManager.redBright),
                          style: getRegularStyle(fontSize: AppSize.s12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingWidgetCourse(
                    hasPurchasedCourse: false,
                  ),
                  Card(),
                  divider(thickness: 2)
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12, vertical: AppPadding.p8),
                  child: Container(
                    decoration: BoxDecoration(
                        // color: ColorManager.mediumViolet,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: ColorManager.grey)),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        enabled: true,
                        autofocus: true,
                        leading: RichText(
                          text: TextSpan(
                            text: "${index + 1}",
                            style: getBodyLargeStyle(
                                fontSize: AppSize.s20,
                                color: ColorManager.grayLight),
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: ColorManager.SecondaryColorLogo,
                            child: Icon(
                              Icons.play_arrow,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: "name Of Course",
                            style: getRegularStyle(
                                fontSize: AppSize.s20,
                                color: ColorManager.black),
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: "duration",
                            style: getTitleMeduim(
                                fontSize: AppSize.s14,
                                color: ColorManager.SecondaryColorLogo),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: 5, // حدد عدد العناصر هنا
            ),
          ),
        ],
      ),
      bottomNavigationBar: 1 == 3
          ? const SizedBox() // or any other widget for the 'true' case
          : BottomAppBar(
              elevation: 10.2,
              color: ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'courseVideoPage');
                    },
                    text: "Buy Now",
                  )
                ],
              ),
            ),
    );
  }
}
