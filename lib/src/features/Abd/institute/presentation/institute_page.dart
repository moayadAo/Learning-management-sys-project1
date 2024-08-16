import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/icon_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/bottom_sheet/bottom_sheet_base.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';
import 'package:learning_system/core/widgets/random_widget/custom_material_button.dart';
import 'package:learning_system/src/features/Abd/institute/widget/profile_institute_widget.dart';

class InstitutePage extends StatelessWidget {
  const InstitutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:const  ProfileInstituteWidget(
            nameOfInstitution: "",
            imageUrl:
"https://d1csarkz8obe9u.cloudfront.net/posterpreviews/back-to-school-design-template-c4c960caa0c287e4a1b0f3285e86ed9a_screen.jpg?ts=1663920963",
            email: "@gmail.com",
            location: "Damascus", totalWallet: 25, institute: true,),
        bottomNavigationBar: BottomAppBar(
          elevation: 10.2,
          color: ColorManager.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
         
              CustomMaterialButton(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: AppSize.s30,
                  color: ColorManager.blueLightButton,
                  text: "Subscribe",
                  onPressed: (){}),
              CustomMaterialButton(
                  width: MediaQuery.of(context).size.width*0.4,
                  height: AppSize.s30,
                  color: Colors.green,
                  text: "Cost",
                  onPressed: (){}),
              

            ],
          ),
        ),
      ),
    );
  }
}
