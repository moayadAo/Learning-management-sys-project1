import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class CourseWidget extends StatelessWidget {
  CourseWidget(
      {super.key,
      required this.imageUrl,
      this.nameOfTeacher,
      this.onTap,
      required this.nameOfCourse,
      required this.rate,
      required this.priceOfCourse});
  String? nameOfTeacher;
  String imageUrl;
  String nameOfCourse;
  double priceOfCourse;
  void Function()? onTap;
  double rate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: AppSize.s130,
        width: AppSize.s100 * 2.6, // Adjust the width as needed
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: AppSize.s120,
                height: AppSize.s120,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.primaryColorLogo,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: nameOfCourse,
                    style: getBoldStyle(
                        fontSize: AppSize.s16, color: ColorManager.black),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Row(
                  children: [
                    IconManager.user,
                    const SizedBox(width: AppSize.s4), // Add some spacing
                    RichText(
                      text: TextSpan(
                        text: nameOfTeacher,
                        style: getTitleMeduim(
                            fontSize: AppSize.s14,
                            color: ColorManager.grayLight),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppPadding.p6,
                ),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                      text: "$priceOfCourse",
                      style: getHeadLineLarge(
                        fontSize: AppSize.s16,
                        color: ColorManager.SecondaryColorLogo,
                      ),
                    )),
                    const SizedBox(
                      width: AppSize.s60,
                    ),
                    IconManager.star,
                    const SizedBox(width: 4), // Add some spacing
                    RichText(
                      text: TextSpan(
                        text: "$rate",
                        style: getMediumStyle(color: ColorManager.lightGrey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
