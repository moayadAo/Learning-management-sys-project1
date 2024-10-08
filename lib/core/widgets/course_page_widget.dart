import 'package:flutter/material.dart';
import 'package:learning_system/core/widgets/sliver_app_bar/sliver_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/font_manager.dart';

import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';
import 'package:learning_system/src/features/course/presentation/rating_widget.dart';
import 'package:rating_summary/rating_summary.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/utils/values_manager.dart';
class CoursePageWidget extends StatelessWidget {
String nameOfCourse ;
String duration ;
int price ;

  CoursePageWidget({ super.key,
    required this.nameOfCourse,
    required    this.duration,
    required  this.price,
      required this.description,
    required  this.whatYouLearn,
    required this.hasPurchasedCourse,
    required this.durationList,
    required this.nameOfCourseList,
    required  this.descriptionRate,
    required  this.reviewNameStudent});

  String description ;
   String whatYouLearn ;
   bool hasPurchasedCourse;
   String durationList;
   String nameOfCourseList ;
   String descriptionRate;
   String reviewNameStudent;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBarWidget(
          text: "Course Info ",
          background: Container(
            color: ColorManager.SecondaryColorLogo,
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
                            text: nameOfCourse,
                            style: getSemiBoldStyle(
                                fontSize: FontSize.s22,
                                color: ColorManager.black),
                          ),
                        ),
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        RichText(
                          text: TextSpan(
                            text: duration,
                            style: getTitleMeduim(
                                fontSize: FontSize.s14,
                                color: ColorManager.grayLight),
                          ),
                        ),
                      ],
                    ),
                    RichText(
                        text: TextSpan(
                          text: "$price S.P",
                          style: getHeadLineLarge(
                            fontSize: FontSize.s22,
                            color: ColorManager.redBright,
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
                            fontSize: FontSize.s22,
                            color: ColorManager.black),
                      ),
                    ),
                    const SizedBox(
                      height: AppPadding.p8,
                    ),
                    ReadMoreText(
                      description,
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      lessStyle:
                      getMoreOrLess(color: ColorManager.redBright),
                      moreStyle: getMoreOrLess(
                          color: ColorManager.SecondaryColorLogo),
                      style: getTitleMeduim(
                          fontSize: FontSize.s12,
                          color: ColorManager.grayLight),
                    ),
                    const SizedBox(
                      height: AppPadding.p8,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "What you'll learn ",
                        style: getBoldStyle(
                            fontSize: FontSize.s22,
                            color: ColorManager.black),
                      ),
                    ),
                    const SizedBox(
                      height: AppPadding.p8,
                    ),
                    ReadMoreText(
                      whatYouLearn,
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        moreStyle: getMoreOrLess(
                            color: ColorManager.SecondaryColorLogo),
                        lessStyle:
                        getMoreOrLess(color: ColorManager.redBright),
                        style: getRegularStyle(fontSize: FontSize.s12)),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingWidgetCourse(
                  hasPurchasedCourse: hasPurchasedCourse,
                ),
                const Card(),
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
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorManager.grey)),
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
                    trailing: const CircleAvatar(
                      backgroundColor: ColorManager.SecondaryColorLogo,
                      child: Icon(
                        Icons.play_arrow,
                        color: ColorManager.white,
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: nameOfCourseList,
                        style: getRegularStyle(
                            fontSize: AppSize.s20,
                            color: ColorManager.black),
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        text:durationList,
                        style: getTitleMeduim(
                            fontSize: AppSize.s14,
                            color: ColorManager.SecondaryColorLogo),
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: context.watch<CourseCubit>().isExpanded
                ? context.watch<CourseCubit>().totalItems
                : 3, // Show 4 items or all
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:
            const EdgeInsets.symmetric( horizontal: AppPadding.p8),
            child: Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                splashColor: Colors.black,
                minWidth: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 15,
                color: ColorManager.black,
                child: Text(
                  context.watch<CourseCubit>().isExpanded ? 'Show Less' : 'Show More',
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CourseCubit>().toggleList();
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.s20,),
                RichText(
                  text: TextSpan(
                    text: "Student Feedback ",
                    style: getBoldStyle(
                        fontSize: FontSize.s24, color: ColorManager.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: RatingSummary(
              counter: 13,
              average: 3.846,
              showAverage: true,
              counterFiveStars: 7,
              counterFourStars: 4,
              counterThreeStars: 2,
              counterTwoStars: 1,
              counterOneStars: 1,
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
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(2),
                    // color: ColorManager.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration:
                          const BoxDecoration(shape: BoxShape.circle),
                          child: RichText(
                            text: TextSpan(
                              text: reviewNameStudent,
                              style: getBoldStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.black),
                            ),
                          ),
                        ),
                        const RatingWidgetCourse(
                          hasPurchasedCourse: false,
                        ),
                        Container(
                          decoration:
                          const BoxDecoration(shape: BoxShape.circle),
                          child: RichText(
                            text: TextSpan(
                              text: descriptionRate,
                              style: getRegularStyle(
                                  fontSize: FontSize.s16,
                                  color: ColorManager.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: context.watch<CourseCubit>().isExpanded
                ? context.watch<CourseCubit>().totalItems
                : 3, // Show 4 items or all
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                splashColor: Colors.black,
                minWidth: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height / 15,
                color: ColorManager.black,
                child: Text(
                  context.watch<CourseCubit>().isExpanded ? 'Show Less' : 'Show More',
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CourseCubit>().toggleList();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
