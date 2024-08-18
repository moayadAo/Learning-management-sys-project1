import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/utils/app_string.dart';
import 'package:learning_system/core/utils/app_url.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';
import 'package:learning_system/core/widgets/random_widget/article_details_widget.dart';
import 'package:learning_system/src/features/article/cubit/pdf_cubit.dart';
import 'package:learning_system/src/features/article/cubit/pdf_state.dart';
import 'package:learning_system/src/features/course/cubit/article/article_cubit.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FileViewCubit, FileViewState>(
        builder: (context, state) {
          return ArticleDetailsWidget(
              titleOfArticle: context.read<ArticleCubit>().article!.title,
              nameOfTeacher: context.read<ArticleCubit>().article!.author,
              description: context.read<ArticleCubit>().article!.category);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10.2,
        color: ColorManager.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              color: ColorManager.SecondaryColorLogo,
              onPressed: () {
                log(context.read<ArticleCubit>().article!.pathFile);
                context.read<FileViewCubit>().loadPdf(
                    '${AppUrl.articleUrlUpload}${context.read<ArticleCubit>().article!.pathFile}');

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
