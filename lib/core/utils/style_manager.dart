//Function To Get Text Style

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_manager.dart';
import 'font_manager.dart';

Divider divider({
  double height = 0,
  double indent = 0,
  double endIndent = 0,
  double thickness = .3,
  Color color = ColorManager.greyWidget,
}) {
  return Divider(
    endIndent: endIndent,
    indent: indent,
    height: height,
    thickness: thickness,
    color: color,
  );
}

TextStyle _getTextStyle(
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing}) {
  return TextStyle(
      fontFamily: FontManager.fontFamilyIBMPlexSans,
      fontSize: fontSize,
      decoration: TextDecoration.none,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
      color: color ?? ColorManager.textColor);
}

///Regular Style
TextStyle getRegularStyle({double? fontSize = FontSize.s16, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWegihtManager.regular, color: color);
}

///Bold Style
TextStyle getBoldStyle(
    {double? fontSize = FontSize.s16, Color? color, double? letterSpacing}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWegihtManager.bold,
      color: color,
      letterSpacing: letterSpacing);
}

// body large = using in body of page and size is large and using when you want to
// write some thing a main thing and only in page used to display a explaintion of app

TextStyle getBodyLargeStyle({double? fontSize = FontSize.s22, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize,
      color: color ?? ColorManager.darkBlue,
      fontWeight: FontWegihtManager.bold);
}

///body small or meduim the different it is just in font size
/// just send true if meduim and false if small
// body meduim = using in body of page and size is meduim and the text
// and it is a not a main text it is like explain text to a large one.
//body small = using in body of page and size is small and it is using when you
//want to type something small in page ex:Already i have an account?
///body small or meduim
TextStyle getBodyMeduimOrSmall({required bool isMeduim, Color? color}) {
  return _getTextStyle(
      fontSize: isMeduim ? FontSize.s16 : FontSize.s12,
      color: color ?? ColorManager.grey,
      fontWeight: FontWegihtManager.regular);
}

/// label small = use when a word work as a button
TextStyle getLabelSmall({double? fontSize, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize ?? FontSize.s12,
      color: color ?? ColorManager.primary,
      fontWeight: FontWegihtManager.regular);
}

///headlineLarge = using in head line in page it is express about
TextStyle getHeadLineLarge(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
      color: color ?? ColorManager.darkBlue,
      fontSize: fontSize ?? FontSize.s32,
      fontWeight: fontWeight ?? FontWegihtManager.bold);
}

///headlineMedium = using in head lint title but not a main title like a secondary title
TextStyle getHeadLineMeduim(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
      color: color ?? ColorManager.darkBlue,
      fontSize: fontSize ?? FontSize.s18,
      fontWeight: fontWeight ?? FontWegihtManager.medium);
}

///titleMedium = using in title in form filed ex: password
TextStyle getTitleMeduim(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
      color: color ?? ColorManager.grey,
      fontSize: fontSize ?? FontSize.s14,
      fontWeight: fontWeight ?? FontWegihtManager.regular);
}

///SemiBold Style
TextStyle getSemiBoldStyle(
    {double? fontSize = FontSize.s16, required Color? color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWegihtManager.semiBold, color: color);
}

///Bold Style
TextStyle getMediumStyle(
    {double? fontSize = FontSize.s16, Color? color, double? letterSpacing}) {
  return _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWegihtManager.regular,
      color: color,
      letterSpacing: letterSpacing);
}

///Light Style
TextStyle getLightStyle({double? fontSize = FontSize.s16, Color? color}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWegihtManager.light, color: color);
}

///Regular Style
TextStyle getPoppinsStyle(
    {double? fontSize = FontSize.s16,
    required Color? color,
    FontWeight? fontWeight}) {
  return TextStyle(
      fontFamily: FontManager.fontFamilyPoppins,
      fontSize: fontSize,
      // letterSpacing:letterSpacing,
      fontWeight: fontWeight,
      color: color);
}

///headlineLarge = using in head line in page it is express about
TextStyle getMoreOrLess({
  double? fontSize,
  Color? color,
}) {
  return TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color);
}


TextStyle latoFont(){
  return  GoogleFonts.getFont('assets/google_font/RobotoCondensed-Italic-VariableFont_wght.ttf');}
