import 'package:flutter/material.dart';
import 'package:learning_system/core/widgets/random_widget/message.dart';

class MessagesTeacher extends StatelessWidget {
  const MessagesTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessagesWidget(title: "title", message: "message", childCount: 10)
    );
  }
}
