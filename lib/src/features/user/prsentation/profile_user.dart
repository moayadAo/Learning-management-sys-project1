import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

import '../../../../core/utils/style_manager.dart';

class ProfileUser extends StatelessWidget {
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
              IconButton(
                color: ColorManager.white,
                icon: IconManager.pencil,
                onPressed: () {
                  // Handle edit button press
                },
              ),
              IconButton(
                color: ColorManager.white,
                icon: IconManager.bars,
                onPressed: () {
                  // Handle more options button press
                },
              ),
            ],
            backgroundColor: ColorManager.grayDark,
            // title:Text( "Account"),
            expandedHeight: AppSize.s160,
            // floating: false,
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
                                      fontSize: 25, color: ColorManager.white)))
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
                    style:
                    getBoldStyle(fontSize: 20, color: ColorManager.black),
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
          SliverToBoxAdapter(child :divider(height: 6,thickness: 10,color: ColorManager.grayDark)),
SliverToBoxAdapter(
  child: ListView(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    children: [
      ListTile(
        title: Text('Progress Course '),
        trailing: IconManager.angleRight,
        onTap: () {
          // Handle tap
        },
      ),
      divider(height: 6,thickness: 1),
      ListTile(
        title: Text('Finish Course'),
        trailing: IconManager.angleRight,
        onTap: () {
          // Handle tap
        },
      ),
      divider(height: 6,thickness: 1),
      ListTile(
        title: Text('Enroll Course'),
        trailing: IconManager.angleRight,
        onTap: () {
          // Handle tap
        },
      ),
      divider(height: 6,thickness: 1),
      ListTile(
        title: Text('Wish List'),
        trailing: IconManager.angleRight,
        onTap: () {
          // Handle tap
        },
      ),
    ],
  )
  ,
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