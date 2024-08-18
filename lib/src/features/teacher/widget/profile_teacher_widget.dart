import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/bottom_sheet/bottom_sheet_base.dart';
import 'package:learning_system/core/widgets/dialog/dialog.dart';

class ProfileTeacherWidget extends StatelessWidget {
  const ProfileTeacherWidget(
      {super.key,
      required this.totalTeacherWallet,
      required this.imageUrl,
      required this.email,
      required this.subject,
      required this.nameOfTeacher,
      required this.onTapAccount1,
      required this.onTapAccount2,
      required this.teacher,
      required this.cvUrl});

  final int totalTeacherWallet;
  final String imageUrl;
  final String email;
  final String subject;
  final String nameOfTeacher;
  final void Function()? onTapAccount1;
  final void Function()? onTapAccount2;
  final void Function() cvUrl;

  final bool teacher;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: IconButton(
            color: ColorManager.white,
            icon: IconManager.arrowLeft,
            onPressed: () {
              // Handle back button press
            },
          ),
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: ColorManager.white,
                  icon: IconManager.pencil,
                  onPressed: () {
                    bottomSheetBase(
                      context: context,
                      content: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ListTile(
                            title: Text('Edit Name', style: getLightStyle()),
                            trailing: IconManager.pencilSquare,
                            onTap: () {
                              // Handle tap
                            },
                          ),
                          const Divider(height: 6, thickness: 1),
                          ListTile(
                            title: Text('Edit Image', style: getLightStyle()),
                            trailing: IconManager.picture,
                            onTap: () {
                              // Handle tap
                            },
                          ),
                          const Divider(height: 6, thickness: 1),
                          ListTile(
                            title: Text('Edit Age', style: getLightStyle()),
                            trailing: IconManager.calender,
                            onTap: () {
                              // Handle tap
                            },
                          ),
                          const Divider(height: 6, thickness: 1),
                          ListTile(
                            title: Text('Edit Email', style: getLightStyle()),
                            trailing: IconManager.email,
                            onTap: () {
                              // Handle tap
                            },
                          ),
                        ],
                      ),
                      title: 'Edit Info',
                    );
                  },
                );
              },
            ),
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
            background: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: AppPadding.p70,
                  left: AppPadding.p20,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: AppSize.s40,
                          backgroundImage: NetworkImage(imageUrl),
                          // backgroundImage: context
                          //             .read<UserCubit>()
                          //             .userModel!
                          //             .image ==
                          //         null
                          //     ? const AssetImage(AssetsManager
                          //         .logoIMGWithoutBackground)
                          //     : NetworkImage(
                          //         "${AppUrl.imageProfileUrl}${context.read<UserCubit>().userModel!.image!}"),
                        ),
                        const SizedBox(width: 25),
                        RichText(
                          text: TextSpan(
                            text: nameOfTeacher,
                            style: getBoldStyle(
                                fontSize: 25, color: ColorManager.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                        fontSize: FontSize.s24, color: ColorManager.black),
                  ),
                ),
                const SizedBox(height: AppPadding.p10),
                RichText(
                  text: TextSpan(
                    text: "Email",
                    style: getTitleMeduim(
                        color: ColorManager.black, fontSize: FontSize.s18),
                  ),
                ),
                const SizedBox(height: AppPadding.p6),
                Row(
                  children: [
                    IconManager.email,
                    const Card(),
                    RichText(
                      text: TextSpan(
                        text: email,
                        style: getLabelSmall(
                            color: ColorManager.grayLight,
                            fontSize: FontSize.s14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppPadding.p10),
                RichText(
                  text: TextSpan(
                    text: "Subject",
                    style: getTitleMeduim(
                        color: ColorManager.black, fontSize: FontSize.s18),
                  ),
                ),
                const SizedBox(height: AppPadding.p6),
                Row(
                  children: [
                    IconManager.book2,
                    const Card(),
                    RichText(
                      text: TextSpan(
                        text: subject,
                        style: getLabelSmall(
                            color: ColorManager.grayLight,
                            fontSize: FontSize.s14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppPadding.p10),
                RichText(
                  text: TextSpan(
                    text: "Accounts",
                    style: getTitleMeduim(
                        color: ColorManager.black, fontSize: FontSize.s18),
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
                    text: "CV",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: cvUrl,
              ),
              const Divider(height: 6, thickness: 1),
              ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "Courses",
                    style: getBoldStyle(
                        fontSize: FontSize.s20, color: ColorManager.black),
                  ),
                ),
                trailing: IconManager.angleRight,
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.browseCoursePage);
                },
              ),
              teacher
                  ? Column(
                      children: [
                        const Divider(height: 6, thickness: 1),
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              text: "Wallet",
                              style: getBoldStyle(
                                  fontSize: FontSize.s20,
                                  color: ColorManager.black),
                            ),
                          ),
                          trailing: IconManager.angleRight,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogWidget(
                                    topWidget: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: ColorManager.primary,
                                            ))
                                      ],
                                    ),
                                    contentWidget: Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                'You have it in your wallet : ',
                                            style: getBoldStyle(
                                                fontSize: FontSize.s20,
                                                color: ColorManager.primary),
                                            children: [
                                              TextSpan(
                                                text: "$totalTeacherWallet",
                                                style: const TextStyle(
                                                  fontSize: FontSize.s20,
                                                  color: ColorManager
                                                      .redBright, // Replace with your desired color
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' S.P',
                                                style: getBoldStyle(
                                                    fontSize: FontSize.s20,
                                                    color:
                                                        ColorManager.primary),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: AppSize.s50,
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        const Divider(height: 6, thickness: 1),
                        ListTile(
                          title: RichText(
                            text: TextSpan(
                              text: "Add Course ",
                              style: getBoldStyle(
                                  fontSize: FontSize.s20,
                                  color: ColorManager.black),
                            ),
                          ),
                          trailing: IconManager.angleRight,
                          onTap: () {
                            Navigator.pushNamed(context, 'create_course_page');
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
              const Divider(height: 6, thickness: 1),
            ],
          ),
        ),
      ],
    );
  }
}
