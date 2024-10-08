import 'package:flutter/material.dart';

class ColorManager {
  ///
  static const textColor = Color(0xff454545);
  static const textFieldColor = Color(0xffFFFFFF);
  static const textFieldHintColor = Color(0xff656565);
  static const shadowColor = Color(0x40000000);
  static const shadowLightColor = Color(0x1A000000);
  static const meterColor = Color(0xffB1B1B1);

  ///our App Color
  static const Color primary = Color(0xFF3D5CFF);
  static const Color secondary = Color(0xFFCEECFE);
  static const Color violate = Color(0xFFEFE0FF);
  static const Color purple = Color(0xFF440687);
  static const Color mediumViolet = Color(0xFF9065BE);
  static const Color lightOrange = Color(0xFFFFEBF0);
  static const Color orange = Color(0xFFFF6905);
  static const Color lightBlue = Color(0xFFCEF4EB);
  static const Color darkBlue = Color(0xFF1F1F39);
  static const Color moreLightOrange = Color(0xFFFFE7EE);
  static const Color lightGrey = Color(0xFFB8B8D2);
  static const Color grey = Color(0xff858597);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xFF000000);

  static const Color jewelry = Color(0xFFEED127);
  static const Color buttonColor = Color(0xFFFFEBF0);

  static const Color primaryColorLogo = Color(0xFFFFC604);
  static const Color SecondaryColorLogo = Color(0xFF45a1b8);
  static const Color blackColorLogo = Color(0xFF3D3839);

  static const appBarColor = Color(0xffFAFAFA);
  // static const appBarColor = Color(0xffF3F3F3);

  ///--- Neutral
  static const red = Color(0xffFF4C4C);

  static const greyWidget = Color(0xffD9D9D9);
  static const redBright = Color(0xffFF4D00); //GrayLight (رمادي فاتح)
  static const grayLight = Color(0xffAAAAAA); //RedBright (أحمر مشرق)
  static const grayDark = Color(0xff454545); //GrayDark (رمادي داكن)
  static const orangeBright = Color(0xffFF6D00); //OrangeBright (برتقالي مشرق)
  static const orangeSunset =
      Color(0xffFF8412); //"OrangeSunset" (غروب الشمس البرتقالي)
  static const skyBlue = Color(0xffB6DEFF);
  // static const darkGrey = Color(0xff827D89);
  // static const lightGrey = Color(0xffEFEEF0);

  /// ---------------<button>----------------
  static const violetButton = Color(0xFF8338ec);
  static const violet3Button = Color(0xFF7209b7);
  static const violet2Button = Color(0xFFb5179e);
  static const greenLightButton = Color(0xFFa1ff0a);
  static const redButton = Color(0xFFff006e);
  static const whiteNiceButton = Color(0xFFfdfcdc);
  static const blueLightButton = Color(0xFF83c5be);
  static const blueLight2Button = Color(0xFFa9def9);
  static const pinkButton = Color(0xFFff99c8);
  static const yellow = Color(0xFFF9E85A);

  ///--- Scaffold BackGround
  static const scaffoldBackgroundLight = Color(0xffFAFAFA);
  // static const scaffoldBackgroundLight = Color(0xffF3F3F3);
  static const scaffoldBackgroundDark = Color(0xff000000);

  ///--- Success
  static const success = Color(0xff4AC064);
  static const successDark = Color(0xff1F7F40);
  static const successLight = Color(0xffDAF6E4);

  ///--- Error
  static const error = Color(0xffFE6A60);
  static const errorDark = Color(0xff5A1623);
  static const errorLight = Color(0xffF7DEE3);

  ///--- Warning
  static const warning = Color(0xffFFC83C);
  static const warningDark = Color(0xff725A03);
  static const warningLight = Color(0xffFDEBAB);

  ///--- gradient
  static const Color startColor = Color(0xFFFF9A00);
  static const Color endColor = Color(0xFFFF4D00);
  static const Gradient myGradient = LinearGradient(
    colors: [startColor, endColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
  static final List<Color> gradientColors = [
    startColor,
    endColor,
  ];

  ///
}
