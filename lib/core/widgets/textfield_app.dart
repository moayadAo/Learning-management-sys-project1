import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/font_manager.dart';
import '../utils/color_manager.dart';
import '../utils/values_manager.dart';

class TextFiledApp extends StatefulWidget {
  TextFiledApp({
    super.key,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.iconData,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.wantObscure = false, // New bool to control behavior
    this.validator,
    this.onChanged,
    this.onTap,
    this.autofocus = false,
    this.readOnly = false,
    this.maxLine = 1,
    this.minLine = 1,
    this.fillColor = ColorManager.textFieldColor,
    this.textFieldHintColor = ColorManager.textFieldHintColor,
    this.requiredField = false,
    this.helperText,
  });

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final String? helperText;
  final Widget? suffixIcon; // Keep this as a Widget
  final bool wantObscure; // Control whether to show password toggle
  final bool autofocus;
  final bool readOnly;
  final bool requiredField;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxLine;
  final int? minLine;
  final Color? fillColor;
  final Color? textFieldHintColor;

  @override
  State<TextFiledApp> createState() => _TextFiledAppState();
}

class _TextFiledAppState extends State<TextFiledApp> {
  void showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      minLines: widget.minLine,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
          (String? val) {
            if (val!.trim().isEmpty && widget.requiredField) {
              return 'Field is required*';
            }
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        helperMaxLines: 2,
        helperText: widget.helperText,
        contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        filled: true,
        fillColor: widget.fillColor,
        hintStyle: TextStyle(
          fontSize: FontSize.s14,
          color: widget.textFieldHintColor,
        ),
        prefixIcon: widget.iconData == null
            ? null
            : Icon(
                widget.iconData,
              ),
        suffixIcon: widget.wantObscure
            ? IconButton(
                onPressed: () {
                  showPassword();
                },
                icon: Icon(
                  widget.obscureText ? Icons.lock_open : Icons.lock_outline,
                  color: !widget.obscureText
                      ? Theme.of(context).primaryColor
                      : ColorManager.textFieldHintColor,
                ),
              )
            : widget.suffixIcon, // Use custom widget if `wantObscure` is false
        hintText: widget.hintText,
      ),
    );
  }
}
