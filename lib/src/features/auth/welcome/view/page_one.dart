import 'package:flutter/material.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p8),
                    child: TextButton(
                        onPressed: () {
                          getIt<CacheHelper>().saveData(
                              key: AppString.cacheIsVisitedOnBoarding,
                              value: true);
                          controller.animateToPage(
                            2,
                            duration: Durations.extralong4,
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        child: Text(
                          'Skip',
                          style: getTitleMeduim(),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                AssetsManager.welcome1,
                width: getWidth(context),
                height: getHeight(context) / 3,
              ),
              Padding(
                //edit with media query to be dynamic
                padding: const EdgeInsets.only(top: 38.0, left: 110, right: 85),
                child: Text('Numerous free trial courses',
                    textAlign: TextAlign.center, style: getBodyLargeStyle()),
              ),
              Padding(
                //edit with media query to be dynamic
                padding: EdgeInsets.only(right: 85.0, left: 82.0, top: 8.0),
                child: Text(
                  'Free courses for you to find your way to learning',
                  textAlign: TextAlign.center,
                  style: getBodyMeduimOrSmall(isMeduim: true),
                ),
              ),
              const SizedBox(
                height: 40,
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
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
