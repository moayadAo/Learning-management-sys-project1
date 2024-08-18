import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/widgets/custom_button/custom_button.dart';
import 'package:learning_system/src/features/article/cubit/pdf_cubit.dart';
import 'package:learning_system/src/features/article/cubit/pdf_state.dart';

class FileViewWidget extends StatelessWidget {

  const FileViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.SecondaryColorLogo,
        leading: BackButton(
          color: ColorManager.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:     RichText(
          text: TextSpan(
            text: "File Viewer",
            style: getHeadLineLarge(
                fontSize: FontSize.s22,
                color: ColorManager.white),
          ),
        ),
      ),
      body: BlocBuilder<FileViewCubit, FileViewState>(
        builder: (context, state) {
          return state is FileViewLoading
              ? const Center(child: CircularProgressIndicator())
              : state is FileViewLoaded
              ? const PDF().cachedFromUrl(
            context.read<FileViewCubit>().pdfUrl,
            placeholder: (progress) =>
                Center(child: Text('$progress %')),
            errorWidget: (error) =>
                Center(child: Text(error.toString())),

          )
              : state is FileViewError
              ? Center(child: Text(state.message))
              : const Center(child: Text('Unknown Error'));
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

              },
              text: "Done",
            )
          ],
        ),
      ),
    );
  }
}
