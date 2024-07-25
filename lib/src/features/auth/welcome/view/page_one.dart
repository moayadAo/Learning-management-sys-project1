import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePageOne extends StatelessWidget {
  const WelcomePageOne({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 80,
            // ),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p8),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Skip',
                        style: getTitleMeduim(),
                      )),
                ),
              ],
            ),
            Image.asset(
              AssetsManager.welcome1,
              width: 260,
              height: 260,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38.0, left: 110, right: 85),
              child: Text('Numerous free trial courses',
                  textAlign: TextAlign.center, style: getBodyLargeStyle()),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 85.0, left: 82.0, bottom: 62, top: 8.0),
              child: Text(
                'Free courses for you to find your way to learning',
                textAlign: TextAlign.center,
                style: getBodyMeduimOrSmall(isMeduim: true),
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  dotWidth: 15.76,
                  dotHeight: 5.63,
                  activeDotColor: Color(0xff3D5CFF),
                  dotColor: Color(0xffEAEAFF)),
            ),
          ],
        ),
      ),
    );
  }
}
