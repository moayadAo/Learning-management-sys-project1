import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/src/features/article/cubit/pdf_cubit.dart';


class QuizWelcome extends StatelessWidget {
  const QuizWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
           const  SizedBox(
                width: AppSize.s160,
                height: AppSize.s160,
                child:  Image(
          image: AssetImage(AssetsManager.quizIcon),
                  fit: BoxFit.fill,
                )),
            RichText(
              text: TextSpan(
                text: "Title Of quiz ! ",
                style: getBoldStyle(
                  fontSize: AppSize.s50,
                     color: ColorManager.black),
              ),
            ),
            SizedBox(height: AppSize.s50,),

            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                splashColor: Colors.black,
                minWidth: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height / 15,
                color: ColorManager.SecondaryColorLogo,
                child: Text(
                  'Are you ready !',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.fileViewWidget);
                  context.read<FileViewCubit>().loadPdf("https://drive.google.com/uc?export=download&id=1xxvwYFCH1x_vilvOMwUsKduqJIB7UeXv");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
