import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/bottom_sheet/bottom_sheet_base.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                  Navigator.pushNamed(context, 'pages_move');
                },
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
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: AppSize.s40,
                            backgroundImage: NetworkImage(
                                'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png'),
                          ),
                          const SizedBox(width: 25),
                          RichText(
                            text: TextSpan(
                              text: "Abd Alrifai",
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
                  Text(
                    "Info",
                    style: getBoldStyle(fontSize: 20, color: ColorManager.black),
                  ),
                  const SizedBox(height: AppPadding.p10),
                  Text("Email", style: getTitleMeduim()),
                  const SizedBox(height: AppPadding.p6),
                  Text("abd.alrifai@gmail.com",
                      style: getLabelSmall(color: ColorManager.grayDark)),
                  const SizedBox(height: AppPadding.p10),
                  Text("Age", style: getTitleMeduim()),
                  const SizedBox(height: AppPadding.p6),
                  Text("24 years old",
                      style: getLabelSmall(color: ColorManager.grayDark)),
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
                    Navigator.pushNamed(context, 'progress_course');
                  },
                ),
                const Divider(height: 6, thickness: 1),
                ListTile(
                  title: Text('Finish Course'),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, 'finish_course');
                  },
                ),
                const Divider(height: 6, thickness: 1),
                ListTile(
                  title: Text('Enroll Course'),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, 'enroll_course');
                  },
                ),
                const Divider(height: 6, thickness: 1),
                ListTile(
                  title: Text('Wish List'),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, 'wish_list_page');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
