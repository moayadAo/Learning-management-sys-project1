import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/color_manager.dart';
import 'package:learning_system/core/utils/values_manager.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    required this.onChanged,
    required this.iconClosePressed,
  });
  void Function(String) onChanged;
  void Function() iconClosePressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        enabled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(AppPadding.p16),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1, color: ColorManager.white),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: Container(
          padding: const EdgeInsets.all(10),
          child: const Icon(Icons.search),
        ),
        filled: true,
        fillColor: ColorManager.white,
        hintText: '   Search...',
        suffixIcon:
            IconButton(icon: const Icon(Icons.clear), onPressed: iconClosePressed),
      ),
    );
  }
}
