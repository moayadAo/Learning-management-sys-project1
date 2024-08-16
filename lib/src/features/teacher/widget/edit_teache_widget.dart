import 'package:flutter/material.dart';
import 'package:learning_system/core/utils/validator_manager.dart';
import 'package:learning_system/core/widgets/textfield_app.dart';

class EditInfoTeacherWidget extends StatelessWidget {
  EditInfoTeacherWidget({super.key,required this.controller,});
  bool isEditingTitle =false;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFiledApp(
      hintText: 'Enter video Name',
      controller: controller,
      iconData: Icons.title,
      validator: (p0) => ValidatorManager().validateName(
          p0!,
          message: 'Please enter the Name of Video'),
      readOnly: !isEditingTitle,
      suffixIcon: IconButton(
        icon: Icon(
          isEditingTitle ? Icons.check : Icons.edit,
          color: Colors.red,
        ),
        onPressed: () {
          isEditingTitle = !isEditingTitle;
          (context as Element).markNeedsBuild();
        },
      ),
    )
    ;
  }
}
