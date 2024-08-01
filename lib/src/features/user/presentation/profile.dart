import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import '../../../../core/utils/style_manager.dart';

class ProfileUserPage extends StatelessWidget {
  const ProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account",
                style: getBodyLargeStyle(),
              ),
              SizedBox(height: AppSize.s30
                ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      radius: AppSize.s60,
                      backgroundColor: ColorManager.black,
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      bottom: 5,
                      right: 5,
                      child: CircleAvatar(
                        radius: AppSize.s56,
                        backgroundImage: AssetImage("assets/images/logo/photo_2023-07-01_23-38-36.jpg"),
                        //backgroundImage: NetworkImage(""),
                      ),
                    ),
                    Positioned(

                        child: CircleAvatar(
                          radius: AppSize.s16,
                      child: Icon(Icons.camera_alt_outlined),
                      backgroundColor: ColorManager.primary,
                    ))
                  ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Abd Alrifai",
                      style: getHeadLineMeduim(color: ColorManager.grayDark,fontWeight: FontWegihtManager.light),
                    ),
                  ],
                ),
              ),
              divider(thickness: 1),
              Column(
                children: [
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:AppPadding.p25),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Favourite",
                                style: getMediumStyle(color: ColorManager.black),
                              ),
                            Icon(Icons.arrow_forward_ios)

                            ],

                                          ),
                        ),
                      )),
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:AppPadding.p25),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Edit Account",
                                style: getMediumStyle(color: ColorManager.black),
                              ),
                              Icon(Icons.arrow_forward_ios)

                            ],

                          ),
                        ),
                      )),
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:AppPadding.p25),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Setting & Privacy",
                                style: getMediumStyle(color: ColorManager.black),
                              ),
                              Icon(Icons.arrow_forward_ios)

                            ],

                          ),
                        ),
                      )),
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:AppPadding.p25),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Help",
                                style: getMediumStyle(color: ColorManager.black),
                              ),
                              Icon(Icons.arrow_forward_ios)

                            ],

                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
