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
                             physics: NeverScrollableScrollPhysics(),
                             children: [
                               ListTile(
                                 title: Text('Edit Name',style: getLightStyle(),),
                                 trailing: IconManager.pencilSquare,
                                 onTap: () {
                                   // Handle tap
                                 },
                               ),
                               Divider(height: 6, thickness: 1),
                               ListTile(
                                 title: Text('Edit Image',style: getLightStyle(),),
                                 trailing: IconManager.picture,
                                 onTap: () {
                                   // Handle tap
                                 },
                               ),
                               Divider(height: 6, thickness: 1),
                               ListTile(
                                 title: Text('Edit Age',style: getLightStyle(),),
                                 trailing: IconManager.calender,
                                 onTap: () {
                                   // Handle tap
                                 },
                               ),
                               Divider(height: 6, thickness: 1),
                               ListTile(
                                 title: Text('Edit Email',style: getLightStyle(),),
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
                          CircleAvatar(
                            radius: AppSize.s40,
                            backgroundImage: NetworkImage(
                                'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png'),
                          ),
                          SizedBox(
                            width: 25,
                          ),
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
                  SizedBox(
                    height: AppPadding.p10,
                  ),
                  Text("Email", style: getTitleMeduim()),
                  SizedBox(
                    height: AppPadding.p6,
                  ),
                  Text("abd.alrifai@gmail.com",
                      style: getLabelSmall(color: ColorManager.grayDark)),
                  Text("Age", style: getTitleMeduim()),
                  SizedBox(
                    height: AppPadding.p6,
                  ),
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  title: Text('Progress Course '),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, 'progress_course');
                  },
                ),
                Divider(height: 6, thickness: 1),
                ListTile(
                  title: Text('Finish Course'),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, 'finish_course');                  },
                ),
                Divider(height: 6, thickness: 1),
                ListTile(
                  title: Text('Enroll Course'),
                  trailing: IconManager.angleRight,
                  onTap: () {
                    Navigator.pushNamed(context, 'enroll_course');                  },
                ),
                Divider(height: 6, thickness: 1),
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

/*
   SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),                  child: Text(
                    "Progress",
                    style:
                    getBoldStyle(fontSize: 16, color: ColorManager.black),
                  ),
                ),
                SizedBox(
                  height: AppSize.s140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Number of items
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){},
                        child: Container(
                          width: AppSize.s100 * 2.6, // Adjust the width as needed
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorManager.greyWidget,
                            border: Border.all(),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: AppSize.s80,
                                height: AppSize.s80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXAnyb4TAyzdSGEsBmOnGeJoPZPntpTfPsg&ss"),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name Of Course",
                                    style: getHeadLineMeduim(fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      IconManager.user,
                                      Card(),
                                      Text(
                                        "Name of Teacher",
                                        style: getTitleMeduim(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppPadding.p6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$190",
                                        style: getHeadLineLarge(
                                            fontSize: 15,
                                            color: ColorManager.primary),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      IconManager.star,
                                     Card(),
                                      Text(
                                        "5.6",
                                        style: getLabelSmall(color: ColorManager.grayDark),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),                  child: Text(
                  "Finish Course",
                  style:
                  getBoldStyle(fontSize: 16, color: ColorManager.black),
                ),
                ),
                SizedBox(
                  height: AppSize.s140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Number of items
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){},
                        child: Container(
                          width: AppSize.s100 * 2.6, // Adjust the width as needed
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: ColorManager.greyWidget,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: AppSize.s80,
                                height: AppSize.s80,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXAnyb4TAyzdSGEsBmOnGeJoPZPntpTfPsg&ss"),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name Of Course",
                                    style: getHeadLineMeduim(fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      IconManager.user,
                                      Card(),
                                      Text(
                                        "Name of Teacher",
                                        style: getTitleMeduim(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppPadding.p6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$190",
                                        style: getHeadLineLarge(
                                            fontSize: 15,
                                            color: ColorManager.primary),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      IconManager.star,
                                      Card(),
                                      Text(
                                        "5.6",
                                        style: getLabelSmall(color: ColorManager.grayDark),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),                  child: Text(
                  "Enroll Course",
                  style:
                  getBoldStyle(fontSize: 16, color: ColorManager.black),
                ),
                ),
                SizedBox(
                  height: AppSize.s140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5, // Number of items
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){},
                        child: Container(
                          width: AppSize.s100 * 2.6, // Adjust the width as needed
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: ColorManager.greyWidget,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: AppSize.s80,
                                height: AppSize.s80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWXAnyb4TAyzdSGEsBmOnGeJoPZPntpTfPsg&ss"),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name Of Course",
                                    style: getHeadLineMeduim(fontSize: 14),
                                  ),
                                  Row(
                                    children: [
                                      IconManager.user,
                                      Card(),
                                      Text(
                                        "Name of Teacher",
                                        style: getTitleMeduim(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppPadding.p6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$190",
                                        style: getHeadLineLarge(
                                            fontSize: 15,
                                            color: ColorManager.primary),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      IconManager.star,
                                      Card(),
                                      Text(
                                        "5.6",
                                        style: getLabelSmall(color: ColorManager.grayDark),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          */
