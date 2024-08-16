import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import 'package:learning_system/core/utils/style_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
        this.controller,
        this.hintText,
        this.prefixIcon,
        this.minLines,
      this.isPrefix
      });
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final int? minLines;
  final bool? isPrefix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        minLines: minLines,
        controller: controller,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Please enter your information";
          } else {
            return null;
          }
        },

        cursorColor: Colors.black,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          fillColor: Colors.white,
          helperMaxLines: 2,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary,), // Change color as desired
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorManager.grayLight),
              borderRadius: BorderRadius.circular(AppRadius.r8)),
          filled: true,
          hintStyle: getRegularStyle(fontSize: AppSize.s14,color: ColorManager.grayLight),
          hintText: hintText,
          prefixIcon: isPrefix ==true ?Padding(
            padding: const EdgeInsets.all(8.0),
            child: prefixIcon,
          ):null,
        ),
      ),
    );
  }
}
