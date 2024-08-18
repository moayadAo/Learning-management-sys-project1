import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_system/core/cache/cache_helper.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/services/service_locator.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  ///animation
  late AnimationController _controller;
  late Animation<double> animation;

  _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _controller.forward();
  }

  ///end animation
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _initAnimation();
    final bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: AppString.cacheIsVisitedOnBoarding) ??
            false;

    Future.delayed(const Duration(seconds: 2), () {
      // if (!isOnBoardingVisited) {
      Navigator.pushReplacementNamed(context, AppRoute.welcomeScreen);
      // } else {
      // if (getIt<CacheHelper>().getData(key: AppString.token) == null) {
      // Navigator.pushReplacementNamed(context, AppRoute.loginScreen);

      // } else {
      //   context.read<UserCubit>().getUser();
      //   Navigator.pushReplacementNamed(context, AppRoute.profileScreen);
      // }
      // }
    });

    // context.read<SplashCubit>().initSplash(context);// here must i push to howe page or welcome or log in
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.SecondaryColorLogo,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: ColorManager.SecondaryColorLogo,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag:
                      'location-image-${AssetsManager.logoIMGWithoutBackgroundHighResolution}',
                  child: ScaleTransition(
                    scale: animation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsManager.logoIMGWithoutBackgroundHighResolution,
                          width: getWidth(context) / 1.5,
                          height: getWidth(context) / 1.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
