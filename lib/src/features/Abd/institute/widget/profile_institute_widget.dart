import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/dialog/dialog.dart';

class ProfileInstituteWidget extends StatelessWidget {
  const ProfileInstituteWidget(
      {super.key,
      required this.imageUrl,
      required this.email,
      required this.location,
      this.onTapAccount1,
      this.onTapAccount2,
      required this.nameOfInstitution,
        required this.totalWallet,
        required this.institute,


      });
  final String imageUrl;
  final String email;
  final String location;
  final String nameOfInstitution ;
  final void Function()? onTapAccount1;
  final void Function()? onTapAccount2;
  final double totalWallet ;
  final bool institute;



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title:   RichText(
            textAlign: TextAlign.center,
      text: TextSpan(
      text: nameOfInstitution,
      style: getBoldStyle(
          fontSize: FontSize.s22, color: ColorManager.white),
    ),
    ),
          leading: IconButton(
            color: ColorManager.white,
            icon: IconManager.arrowLeft,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              color: ColorManager.white,
              icon: IconManager.homeOutLine,
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.homePage);
              },
            ),
          ],
          backgroundColor: ColorManager.SecondaryColorLogo,
          expandedHeight: AppSize.s160,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
              background: Image.network(fit: BoxFit.fill, imageUrl)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Info",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                const SizedBox(height: AppPadding.p10),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Email",
                        style: getTitleMeduim(color: ColorManager.black),
                      ),
                    ),
                    const Card(),
                    IconManager.emailInstitute
                  ],
                ),
                const SizedBox(height: AppPadding.p6),
                RichText(
                  text: TextSpan(
                    text: email,
                    style: getLabelSmall(color: ColorManager.grayLight),
                  ),
                ),
                const SizedBox(height: AppPadding.p10),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Location",
                        style: getTitleMeduim(color: ColorManager.black),
                      ),
                    ),
                    Card(),
                    IconManager.location
                  ],
                ),
                const SizedBox(height: AppPadding.p6),
                RichText(
                  text: TextSpan(
                    text: location,
                    style: getLabelSmall(color: ColorManager.grayLight),
                  ),
                ),
                const SizedBox(height: AppPadding.p10),
                RichText(
                  text: TextSpan(
                    text: "Accounts",
                    style: getTitleMeduim(color: ColorManager.black),
                  ),
                ),
                const SizedBox(height: AppPadding.p6),
                InkWell(
                  onTap: onTapAccount1,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Facebook",
                          style: getLabelSmall(color: ColorManager.primary),
                        ),
                      ),
                      const Card(),
                      IconManager.facebook
                    ],
                  ),
                ),
                const SizedBox(height: AppPadding.p6),
                InkWell(
                  onTap: onTapAccount2,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Instagram",
                          style: getLabelSmall(color: ColorManager.redButton),
                        ),
                      ),
                      const Card(),
                      IconManager.instagram
                    ],
                  ),
                ),
                const SizedBox(height: AppPadding.p10),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Divider(
            height: 6,
            thickness: 10,
            color: ColorManager.SecondaryColorLogo,
          ),
        ),
        SliverToBoxAdapter(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Teachers",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.getAllTeacherScreen);
                },
              ),
              const Divider(height: 6, thickness: 1),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Scholarship students",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.scholarshipStudentsPage);
                },
              ),
         institute ?   Column(children: [
              const Divider(height: 6, thickness: 1),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Institution students",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.institutionStudentsPage);
                },
              ),
              const Divider(height: 6, thickness: 1),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Pay students",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.payStudentPage);
                },
              ),
              const Divider(height: 6, thickness: 1),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Add a scholarships",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.addScholarshipsPage);
                },
              ),
              const Divider(height: 6, thickness: 1),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Scholarships requests",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.scholarshipsRequestsPage);
                },
              ),
              const Divider(height: 6, thickness: 1),
              ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: "Teachers requests",
                      style: getBoldStyle(
                          fontSize: FontSize.s20, color: ColorManager.black),
                    ),
                  ),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.teacherRequest);
                  }),
              const Divider(height: 6, thickness: 1),
              ListTile(
                  title: RichText(
                    text: TextSpan(
                      text: "Wallet",
                      style: getBoldStyle(
                          fontSize: FontSize.s20, color: ColorManager.black),
                    ),
                  ),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    showDialog(context: context, builder: (context){
                      return DialogWidget(
                        topWidget: Row(
                          children: [
                            InkWell(onTap: (){
                              Navigator.pop(context);
                            },child: Icon(Icons.close,color: ColorManager.primary,))
                          ],
                        ),
                        contentWidget: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'You have it in your wallet : ',
                                style: getBoldStyle(fontSize: FontSize.s20, color: ColorManager.primary),
                                children: [
                                  TextSpan(
                                    text: "$totalWallet",
                                    style:const  TextStyle(
                                      fontSize: FontSize.s20,
                                      color: ColorManager.redBright, // Replace with your desired color
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' S.P',
                                    style: getBoldStyle(fontSize: FontSize.s20, color: ColorManager.primary),
                                  ),
                                ],
                              ),
                            ),
                            const  SizedBox(height: AppSize.s50,)


                          ],
                        ),
                      );
                    });
                  }),
            ],):SizedBox(),

            ],
          ),
        ),
      ],
    );
  }
}
