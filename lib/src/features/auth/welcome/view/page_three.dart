import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/widgets/white_blue_button.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePageThree extends StatelessWidget {
  const WelcomePageThree({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 80,
            // ),
            Row(children: [
              const Spacer(),
            ]),
            Image.asset(
              AssetsManager.welcome3,
              width: 260,
              height: 260,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38.0, left: 90, right: 85),
              child: Text('Create your own study plan',
                  textAlign: TextAlign.center, style: getBodyLargeStyle()),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 85.0, left: 90.0, bottom: 62, top: 8.0),
              child: Text(
                'Study according to the study plan, make study more motivated',
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
            const SizedBox(height: 81),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WhiteBlueButton(
                  label: 'Sign up',
                  width: 160,
                  height: 50,
                  onPressed: () {},
                  isBlue: true,
                ),
                const SizedBox(width: 20),
                WhiteBlueButton(
                  label: 'Log in',
                  width: 160,
                  height: 50,
                  onPressed: () {},
                  isBlue: false,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
