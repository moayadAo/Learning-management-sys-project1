import 'package:flutter/material.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                AssetsManager.welcome3,
                width: getWidth(context),
                height: getHeight(context) / 3,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0, left: 90, right: 85),
                child: Text('Create your own study plan',
                    textAlign: TextAlign.center, style: getBodyLargeStyle()),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 85.0, left: 90.0, top: 8.0),
                child: Text(
                  'Study according to the study plan, make study more motivated',
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
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: WhiteBlueButton(
                        label: 'Sign up',
                        // width: 160,
                        height: 50,
                        onPressed: () {
                          getIt<CacheHelper>().getData(
                                  key: AppString.cacheIsVisitedOnBoarding) ??
                              getIt<CacheHelper>().saveData(
                                  key: AppString.cacheIsVisitedOnBoarding,
                                  value: true);
                          Navigator.pushNamed(context, 'role');
                        },
                        isBlue: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: WhiteBlueButton(
                        label: 'Log in',
                        height: 50,
                        onPressed: () {
                          getIt<CacheHelper>().getData(
                                  key: AppString.cacheIsVisitedOnBoarding) ??
                              getIt<CacheHelper>().saveData(
                                  key: AppString.cacheIsVisitedOnBoarding,
                                  value: true);
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        isBlue: false,
                      ),
                    )
                  ],
                ),
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
