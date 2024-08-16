import 'package:flutter/material.dart';
import 'package:learning_system/core/widgets/random_widget/requests_widget.dart';

class TeacherRequest extends StatelessWidget {
  const TeacherRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestsWidget(title: "Name of teacher", childCount: 10, confirmPress: () {  }, deletePress: () {  },),
    );
  }
}
