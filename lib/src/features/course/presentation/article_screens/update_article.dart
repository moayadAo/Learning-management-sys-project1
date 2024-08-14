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
import 'package:learning_system/core/widgets/loading_indicator.dart';
import 'package:learning_system/core/widgets/snack_bar.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';
import 'package:learning_system/src/features/course/cubit/article/article_cubit.dart';
import 'package:learning_system/src/features/course/cubit/article/article_states.dart';

class UpdateArticlePage extends StatelessWidget {
  UpdateArticlePage({super.key});
  File? _articleFile;
  late String? filePath;
  bool _isSnackBarVisible = false;
  bool _isEditingTitle = false;
  bool _isEditingCategory = false;
  bool _isEditingAuthor = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<ArticleCubit, ArticleState>(
      listener: (context, state) {
        if (state is LoadArticleFailureState) {
          ///should remove
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBarMessage(message: 'Choose your article, please')
          //         .buildSnackBar(context));
        }
      },
      builder: (context, state) {
        final cubit = context.read<ArticleCubit>();
        filePath = context.read<ArticleCubit>().article!.pathFile;
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
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppPadding.p8),
                        Center(
                          child: Text(
                            "Update Article",
                            style: getHeadLineLarge(),
                          ),
                        ),
                        const SizedBox(height: AppPadding.p16),

                        // Dynamic Button for Uploading or Editing Article
                        state is LoadArticleLoadingState
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  // Toggle to upload mode
                                  _articleFile = await cubit.pickDocument();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.lightGrey,
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
                                        ? const Icon(Icons.edit,
                                            color: ColorManager.black)
                                        : const Icon(Icons.upload_file,
                                            color: ColorManager.black),
                                    const SizedBox(width: AppMargin.m6),
                                    state is LoadArticleSuccessState
                                        ? const Text(
                                            'New Article',
                                            style: TextStyle(
                                                color: ColorManager.white),
                                          )
                                        : Text(
                                            cubit.article!.title,
                                            style: const TextStyle(
                                                color: ColorManager.white),
                                          ),
                                  ],
                                ),
                              ),

                        const SizedBox(height: AppPadding.p35),

                        // Title TextField
                        TextFiledApp(
                          hintText: 'Enter article Title',
                          controller: cubit.articleTitle,
                          iconData: Icons.title,
                          validator: (p0) => ValidatorManager().validateName(
                              p0!,
                              message: 'Please enter the Title of Article'),
                          readOnly: !_isEditingTitle,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isEditingTitle ? Icons.check : Icons.edit,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _isEditingTitle = !_isEditingTitle;
                              (context as Element).markNeedsBuild();
                            },
                          ),
                        ),

                        const SizedBox(height: AppPadding.p20),

                        // Category TextField
                        TextFiledApp(
                          controller: cubit.articleCategory,
                          hintText: 'Enter Article Category',
                          iconData: Icons.category_outlined,
                          maxLine: 3,
                          readOnly: !_isEditingCategory,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isEditingCategory ? Icons.check : Icons.edit,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _isEditingCategory = !_isEditingCategory;
                              (context as Element).markNeedsBuild();
                            },
                          ),
                        ),

                        const SizedBox(height: AppPadding.p20),

                        // Author TextField
                        TextFiledApp(
                          controller: cubit.articleAuthor,
                          hintText: 'Enter Article Author',
                          iconData: Icons.edit_document,
                          readOnly: !_isEditingAuthor,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isEditingAuthor ? Icons.check : Icons.edit,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _isEditingAuthor = !_isEditingAuthor;
                              (context as Element).markNeedsBuild();
                            },
                          ),
                        ),

                        const SizedBox(height: AppPadding.p32),

                        // Update Article Button
                        state is CreateArticleLoadingState
                            ? LoadingIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      _articleFile != null) {
                                    cubit.updateArticleApi(
                                      articleId: '66bcc749330617bbb4894d60',
                                      title: cubit.articleTitle.text,
                                      pathFile: _articleFile!,
                                      author: cubit.articleAuthor.text,
                                      category: cubit.articleCategory.text,
                                    );
                                  } else {
                                    if (!_isSnackBarVisible) {
                                      _isSnackBarVisible = true;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                            SnackBarMessage(
                                                    message:
                                                        'Choose your article, please')
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
                                  backgroundColor: ColorManager.blueLightButton,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p16),
                                  textStyle: const TextStyle(
                                    fontSize: FontSize.s18,
                                    color: ColorManager.blackColorLogo,
                                    fontWeight: FontWegihtManager.regular,
                                  ),
                                  iconColor: ColorManager.white,
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: AppMargin.m6),
                                    Text('Update Article'),
                                  ],
                                ),
                              ),
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
}
