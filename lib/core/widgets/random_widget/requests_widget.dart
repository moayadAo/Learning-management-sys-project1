import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';
import 'package:learning_system/core/widgets/random_widget/custom_material_button.dart';

class RequestsWidget extends StatelessWidget {
  const RequestsWidget(
      {super.key,
      required this.title,
      required this.childCount,required this.confirmPress,required this.deletePress});
  final String title;
  final int childCount;
  final void Function()? confirmPress;
  final void Function()? deletePress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor :ColorManager.white,
            backgroundColor: ColorManager.SecondaryColorLogo,
            title: RichText(
              text: TextSpan(
                text: "Subscribe requests",
                style: getSemiBoldStyle(
                    fontSize: FontSize.s24, color: ColorManager.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: title,
                            style: getBoldStyle(
                                fontSize: FontSize.s18,
                                color: ColorManager.black),
                          ),
                        ),
                        Card(),
                        RichText(
                          text: TextSpan(
                            text: "request to follow you",
                            style: getSemiBoldStyle(
                                fontSize: FontSize.s16,
                                color: ColorManager.grayLight),
                          ),
                        ),
                        SizedBox(height: AppPadding.p16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            CustomMaterialButton(
                                width: MediaQuery.of(context).size.width*0.4,
                                height: AppSize.s30,
                                color: ColorManager.blueLightButton,
                                text: "Confirm",
                                onPressed: confirmPress),

                            CustomMaterialButton(
                                width: MediaQuery.of(context).size.width*0.4,
                                height: AppSize.s30,
                                color: ColorManager.red,
                                text: "Delete  ",
                                onPressed:deletePress),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: childCount),
          ),
        ],
      ),
    );
  }
}
