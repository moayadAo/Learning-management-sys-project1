import 'package:flutter/material.dart';
import 'package:learning_system/src/features/teacher/widget/edit_teache_widget.dart';

class EditInfoTeacher extends StatelessWidget {
  EditInfoTeacher({super.key});
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EditInfoTeacherWidget(
          controller: controller,
        ),
      ),
    );
  }
}
