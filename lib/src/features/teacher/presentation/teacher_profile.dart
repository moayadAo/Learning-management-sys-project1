import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/bottom_sheet/bottom_sheet_base.dart';
import 'package:learning_system/core/widgets/dialog/dialog.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_cubit.dart';
import 'package:learning_system/src/features/teacher/cubit/teacher_states.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherCubit, TeacherStates>(
  builder: (context, state) {
    return Scaffold(
      body:  CustomScrollView(
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
                          physics:
                          const NeverScrollableScrollPhysics(),
                          children: [
                            ListTile(
                              title: Text('Edit Name',
                                  style: getLightStyle()),
                              trailing: IconManager.pencilSquare,
                              onTap: () {
                                // Handle tap
                              },
                            ),
                            const Divider(
                                height: 6, thickness: 1),
                            ListTile(
                              title: Text('Edit Image',
                                  style: getLightStyle()),
                              trailing: IconManager.picture,
                              onTap: () {
                                // Handle tap
                              },
                            ),
                            const Divider(
                                height: 6, thickness: 1),
                            ListTile(
                              title: Text('Edit Age',
                                  style: getLightStyle()),
                              trailing: IconManager.calender,
                              onTap: () {
                                // Handle tap
                              },
                            ),
                            const Divider(
                                height: 6, thickness: 1),
                            ListTile(
                              title: Text('Edit Email',
                                  style: getLightStyle()),
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
                onPressed: () {},
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
                      padding:
                      const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: AppSize.s40,
                            backgroundImage: AssetImage(
                                AssetsManager
                                    .logoIMGWithoutBackground),
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
                              text:
                              'Aboood Sy',
                              style: getBoldStyle(
                                  fontSize: 25,
                                  color: ColorManager.white),
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
                      style: getHeadLineLarge(
                          fontSize: FontSize.s24, color: ColorManager.black),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "summery",
                      style: getTitleMeduim(
                          fontSize: FontSize.s22, color: ColorManager.black),
                    ),
                  ),
                  const SizedBox(height: AppPadding.p10),
                  RichText(
                    text: TextSpan(
                      text: "Email",
                      style: getTitleMeduim(
                          fontSize: FontSize.s18, color: ColorManager.grayLight),
                    ),
                  ),
                  const SizedBox(height: AppPadding.p6),
                  RichText(
                    text: TextSpan(
                      text: "abood@gmail.com",
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s14, color: ColorManager.grayDark),
                    ),
                  ),
                  const SizedBox(height: AppPadding.p10),
                  RichText(
                    text: TextSpan(
                      text: "Subject",
                      style: getTitleMeduim(
                          fontSize: FontSize.s18, color: ColorManager.grayLight),
                    ),
                  ),
                  const SizedBox(height: AppPadding.p6),
                  RichText(
                    text: TextSpan(
                      text: "Programming",
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s14, color: ColorManager.grayDark),
                    ),
                  ),
                  const SizedBox(height: AppPadding.p10),
                  RichText(
                    text: TextSpan(
                      text: "Social Media Accounts",
                      style: getTitleMeduim(
                          fontSize: FontSize.s18, color: ColorManager.grayLight),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(

                        onPressed: (){},
                        child: RichText(
                          text: TextSpan(
                            text: "facebook",
                            style: getSemiBoldStyle(
                                fontSize: FontSize.s14, color: ColorManager.primary),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: RichText(
                          text: TextSpan(
                            text: "instagram",
                            style: getSemiBoldStyle(
                                fontSize: FontSize.s14, color: ColorManager.redButton),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
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
                const Divider(height: 6, thickness: 1),
                const Divider(height: 6, thickness: 1),
                ListTile(
                  title:RichText(
                    text: TextSpan(
                      text: "CV",
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s24, color: ColorManager.black),
                    ),
                  ),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    context.read<TeacherCubit>().loadCv("https://drive.google.com/uc?export=download&id=1xxvwYFCH1x_vilvOMwUsKduqJIB7UeXv");

                    Navigator.pushNamed(context, AppRoute.teacherCv);
                  },
                ),

                const Divider(height: 6, thickness: 1),
                const Divider(height: 6, thickness: 1),                ListTile(
                  title:RichText(
                    text: TextSpan(
                      text: "Courses",
                      style: getSemiBoldStyle(
                          fontSize: FontSize.s24, color: ColorManager.black),
                    ),
                  ),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoute.teacherCourses);
                  },
                ),
                context.read<TeacherCubit>().rule=="teacher"?   Column(
                 children: [
                   const Divider(height: 6, thickness: 1),
                   const Divider(height: 6, thickness: 1),
                   ListTile(
                     title:RichText(
                       text: TextSpan(
                         text: "Wallet",
                         style: getSemiBoldStyle(
                             fontSize: FontSize.s24, color: ColorManager.black),
                       ),
                     ),
                     trailing: IconManager.angleRight,
                     onTap: () {
                       showDialog(context: context, builder: (context){
                         return DialogWidget(
                           topWidget: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               GestureDetector(
                                 behavior: HitTestBehavior.opaque,
                                 onTap: () =>  Navigator.of(context).pop(),
                                 child: const Icon(
                                   Icons.close,
                                   size: 25,
                                   color: ColorManager.mediumViolet,
                                 ),
                               ),

                             ],
                           ),
                           contentWidget:Row(
                             children: [
                               //  IconManager.message,
                               RichText(
                                 text: TextSpan(
                                   text: "Your wallet contains:  250 S.P",
                                   style: getSemiBoldStyle(
                                       fontSize: FontSize.s18, color: ColorManager.black),
                                 ),
                               ),
                             ],
                           ) ,
                         );
                       });

                     },
                   ),
                   const Divider(height: 6, thickness: 1),
                   const Divider(height: 6, thickness: 1),
                   ListTile(
                     title: RichText(
                       text: TextSpan(
                         text: "Message",
                         style: getSemiBoldStyle(
                             fontSize: FontSize.s24, color: ColorManager.black),
                       ),
                     ),
                     trailing: IconManager.angleRight,
                     onTap: () {
                       Navigator.pushNamed(
                           context, AppRoute.messagesTeacher);
                     },
                   ),

                 ],
               ):context.read<TeacherCubit>().rule=="user" ?SizedBox():SizedBox(),
                const Divider(height: 6, thickness: 1),
                const Divider(height: 6, thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
