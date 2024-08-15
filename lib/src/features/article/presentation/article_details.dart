import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';
import 'package:learning_system/core/widgets/random_widget/article_details_widget.dart';
import 'package:learning_system/core/widgets/sliver_app_bar/sliver_app_bar.dart';
import 'package:learning_system/src/features/article/cubit/pdf_cubit.dart';
import 'package:learning_system/src/features/article/cubit/pdf_state.dart';
import 'package:learning_system/src/features/course/presentation/rating_widget.dart';
import 'package:readmore/readmore.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FileViewCubit, FileViewState>(
        builder: (context, state) {
          return ArticleDetailsWidget(titleOfArticle: "titleOfArticle", nameOfTeacher: "nameOfTeacher", description: "description");
        },
      ),
      bottomNavigationBar:BottomAppBar(
              elevation: 10.2,
              color: ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    color: ColorManager.SecondaryColorLogo,
                    onPressed: () {
                      context.read<FileViewCubit>().loadPdf(
                          "https://drive.google.com/uc?export=download&id=1xxvwYFCH1x_vilvOMwUsKduqJIB7UeXv");

                      Navigator.pushNamed(context, AppRoute.fileViewWidget);
                    },
                    text: "Read Now",
                  )
                ],
              ),
            ),
    );
  }
}
