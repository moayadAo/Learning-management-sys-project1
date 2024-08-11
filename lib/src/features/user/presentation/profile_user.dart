import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/src/features/user/cubit/user_cubit.dart';
import 'package:learning_system/src/features/user/cubit/user_states.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/bottom_sheet/bottom_sheet_base.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserStates>(
      builder: (context, state) {
        return Scaffold(
          body: state is GetUserLoading
              ? Center(
                  child: LoadingIndicator(
                    height: AppSize.s50,
                    width: AppSize.s50,
                  ),
                )
              : state is GetUserSuccess
                  ? CustomScrollView(
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
                          backgroundColor: ColorManager.primaryColorLogo,
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
                                                '${context.read<UserCubit>().userModel!.firstName} ${context.read<UserCubit>().userModel!.lastName}',
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
                                Text(
                                  "Info",
                                  style: getBoldStyle(
                                      fontSize: 20, color: ColorManager.black),
                                ),
                                const SizedBox(height: AppPadding.p10),
                                Text("Email", style: getTitleMeduim()),
                                const SizedBox(height: AppPadding.p6),
                                Text(
                                    context
                                        .read<UserCubit>()
                                        .userModel!
                                        .credentialId!
                                        .email,
                                    style: getLabelSmall(
                                        color: ColorManager.grayDark)),
                                const SizedBox(height: AppPadding.p10),
                              ],
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Divider(
                            height: 6,
                            thickness: 10,
                            color: ColorManager.primaryColorLogo,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ListTile(
                                title: Text('Progress Course '),
                                trailing: IconManager.angleRight,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.progressCourseScreen);
                                },
                              ),
                              const Divider(height: 6, thickness: 1),
                              ListTile(
                                title: Text('Finish Course'),
                                trailing: IconManager.angleRight,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.finishCourseScreen);
                                },
                              ),
                              const Divider(height: 6, thickness: 1),
                              ListTile(
                                title: Text('Enroll Course'),
                                trailing: IconManager.angleRight,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.enrollCourseScreen);
                                },
                              ),
                              const Divider(height: 6, thickness: 1),
                              ListTile(
                                title: Text('Wish List'),
                                trailing: IconManager.angleRight,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.wishListScreen);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  :

                  ///del and edit if failure state
                  const Center(
                      child: Text("WRONG"),
                    ),
        );
      },
    );
  }
}
