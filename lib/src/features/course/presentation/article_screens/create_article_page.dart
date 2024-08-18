import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_system/core/helper/sizer_media_query.dart';
import 'package:learning_system/core/utils/assets_manager.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';
import 'package:learning_system/core/widgets/dialog/dialog.dart';
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/snack_bar.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/core/widgets/white_blue_button.dart';
import 'package:learning_system/src/features/course/cubit/article/article_cubit.dart';
import 'package:learning_system/src/features/course/cubit/article/article_states.dart';
import 'package:learning_system/src/features/course/cubit/course/course_cubit.dart';

class CreateArticlePage extends StatelessWidget {
  CreateArticlePage({super.key});
  File? _articleFile;
  bool _isSnackBarVisible = false;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        if (state is LoadArticleFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarMessage(message: 'choose your article please')
                  .buildSnackBar(context));
        }
        if (state is CreateArticleSuccessState) {
          _showSuccessDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: getHeight(context) / 3,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    AssetsManager.createArticle2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: AppPadding.p8,
                        ),
                        state is LoadArticleLoadingState
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  _articleFile = await context
                                      .read<ArticleCubit>()
                                      .pickDocument();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      state is LoadArticleSuccessState
                                          ? ColorManager.lightGrey
                                          : ColorManager.primaryColorLogo,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p16),
                                  textStyle:
                                      getMediumStyle(fontSize: FontSize.s18),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state is LoadArticleSuccessState
                                        ? const Icon(
                                            Icons
                                                .done_outline, // The icon you want to display
                                            color: ColorManager
                                                .white, // Icon color
                                          )
                                        : const Icon(
                                            Icons
                                                .upload_file, // The icon you want to display
                                            color: ColorManager
                                                .black, // Icon color
                                          ),
                                    const SizedBox(width: AppMargin.m6),
                                    // Spacing between icon and text
                                    state is LoadArticleSuccessState
                                        ? const Text(
                                            'Article Uploaded',
                                            style: TextStyle(
                                                color: ColorManager
                                                    .whiteNiceButton),
                                          )
                                        : const Text(
                                            'Upload Article',
                                            style: TextStyle(
                                                color: ColorManager
                                                    .blackColorLogo),
                                          ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: AppPadding.p35),
                        TextFiledApp(
                          hintText: 'Enter article Title',
                          controller: context.read<ArticleCubit>().articleTitle,
                          iconData: Icons.title,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter Title of Article'),
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller:
                              context.read<ArticleCubit>().articleCategory,
                          hintText: 'Enter Article Category',
                          iconData: Icons.category_outlined,
                          maxLine: 3,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller:
                              context.read<ArticleCubit>().articleAuthor,
                          hintText: 'Enter Article Author',
                          iconData: Icons.edit_document,
                        ),
                        const SizedBox(height: AppPadding.p20),
                        TextFiledApp(
                          controller: context.read<ArticleCubit>().articleOrder,
                          hintText: 'Enter Article order in course',
                          iconData: Icons.arrow_outward_rounded,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'please enter order of video'),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: AppPadding.p32),
                        state is CreateArticleLoadingState
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate() &&
                                      _articleFile != null) {
                                    if (!context
                                        .read<CourseCubit>()
                                        .order
                                        .contains(int.parse(context
                                            .read<ArticleCubit>()
                                            .articleOrder
                                            .text
                                            .trim()))) {
                                      context
                                          .read<ArticleCubit>()
                                          .craeteArticleApi(
                                              order:
                                                  int
                                                      .parse(
                                                          context
                                                              .read<
                                                                  ArticleCubit>()
                                                              .articleOrder
                                                              .text
                                                              .trim()),
                                              title: context
                                                  .read<ArticleCubit>()
                                                  .articleTitle
                                                  .text,
                                              pathFile: _articleFile!,
                                              author: context
                                                  .read<ArticleCubit>()
                                                  .articleAuthor
                                                  .text,
                                              category: context
                                                  .read<ArticleCubit>()
                                                  .articleCategory
                                                  .text);
                                    } else {
                                      if (!_isSnackBarVisible) {
                                        _isSnackBarVisible = true;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                              SnackBarMessage(
                                                      message:
                                                          'choose the order is revrsed')
                                                  .buildSnackBar(context),
                                            )
                                            .closed
                                            .then((reason) {
                                          _isSnackBarVisible = false;
                                        });
                                      }
                                    }
                                  } else {
                                    if (!_isSnackBarVisible) {
                                      _isSnackBarVisible = true;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                            SnackBarMessage(
                                                    message:
                                                        'choose your article please')
                                                .buildSnackBar(context),
                                          )
                                          .closed
                                          .then((reason) {
                                        _isSnackBarVisible = false;
                                      });
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorManager.blueLightButton,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppPadding.p16),
                                    textStyle: const TextStyle(
                                        fontSize: FontSize.s18,
                                        color: ColorManager.blackColorLogo,
                                        fontWeight: FontWegihtManager.regular),
                                    iconColor: ColorManager.white),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons
                                          .celebration_rounded, // The icon you want to display
                                    ),
                                    SizedBox(
                                        width: AppMargin
                                            .m6), // Spacing between icon and text
                                    Text(
                                      'Create Article',
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: AppPadding.p20),
                        WhiteBlueButton(
                          height: 50,
                          label: 'cancel',
                          isBlue: false,
                          colorbut: ColorManager.redBright,
                          width: 50,
                          onPressed: () {
                            Navigator.pop(context);
                            context
                                .read<ArticleCubit>()
                                .resetArticleAfterCreate();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showConfirm(
          title: 'Article Create Done',
          context: context,
          confirm: () {
            context
                .read<CourseCubit>()
                .articleId
                .add(context.read<ArticleCubit>().id!);

            context.read<CourseCubit>().order.add(int.parse(
                context.read<ArticleCubit>().articleOrder.text.trim()));
            context.read<ArticleCubit>().resetArticleAfterCreate();
            Navigator.pop(context);
            Navigator.pop(context);
          });
    });
  }
}
