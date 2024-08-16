import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class IconManager {
  // FontAwesome icons
  static const pencil = FaIcon(
    FontAwesomeIcons.pencil,
    size: 20,
  );
  static const bars = FaIcon(FontAwesomeIcons.bars);
  static const homeOutLine = FaIcon(FontAwesomeIcons.home);
  static const arrowLeft = FaIcon(FontAwesomeIcons.arrowLeft);
  static const arrowRight = FaIcon(
    FontAwesomeIcons.arrowRight,
    color: Colors.white,
  );
  static const titleQusetion = FaIcon(
    FontAwesomeIcons.question,
    color: ColorManager.grayDark,
  );

  static const user = FaIcon(
    FontAwesomeIcons.user,
    size: 14,
    color: ColorManager.grey,
  );
  static const star = FaIcon(
    FontAwesomeIcons.starHalfStroke,
    color: ColorManager.jewelry,
    size: 15,
  );
  static const starFill = FaIcon(
    FontAwesomeIcons.star,
    color: ColorManager.jewelry,
    size: 20,
  );
  static const angleRight = FaIcon(FontAwesomeIcons.angleRight);
  static const pencilSquare = FaIcon(FontAwesomeIcons.pencilSquare);
  static const picture = FaIcon(FontAwesomeIcons.photoFilm);
  static const calender = FaIcon(FontAwesomeIcons.calendar);
  static const search = FaIcon(FontAwesomeIcons.search);
  static const add = FaIcon(
    FontAwesomeIcons.add,
    color: Colors.white,
  );
  static const plus = FaIcon(
    FontAwesomeIcons.plusSquare,
    size: 70,
    color: ColorManager.grayDark,
  );
  static const minPlus = FaIcon(
    FontAwesomeIcons.plusSquare,
    size: 50,
    color: ColorManager.grayDark,
  );

  static const notification = FaIcon(
    FontAwesomeIcons.bell,
    size: 30,
  );
  static const home = FaIcon(
    FontAwesomeIcons.house,
    size: 30,
    color: ColorManager.primaryColorLogo,
  );
  static const message = FaIcon(
    FontAwesomeIcons.message,
    size: 30,
    color: ColorManager.primaryColorLogo,
  );
  static const account = FaIcon(
    FontAwesomeIcons.user,
    size: 30,
    color: ColorManager.primaryColorLogo,
  );
  static const searchBar = FaIcon(
    FontAwesomeIcons.search,
    size: 30,
    color: ColorManager.primaryColorLogo,
  );
  static const book = FaIcon(
    FontAwesomeIcons.book,
    size: 30,
    color: ColorManager.primaryColorLogo,
  );

  // Material Icons
  static const play = Icon(Icons.play_arrow);

  static const a = FaIcon(FontAwesomeIcons.a);
  static const b = FaIcon(FontAwesomeIcons.b);

  static const c = FaIcon(FontAwesomeIcons.c);
  static const d = FaIcon(FontAwesomeIcons.d);
  static const titleQuiz = FaIcon(FontAwesomeIcons.fileLines);
  static const correct = FaIcon(FontAwesomeIcons.check);
}
