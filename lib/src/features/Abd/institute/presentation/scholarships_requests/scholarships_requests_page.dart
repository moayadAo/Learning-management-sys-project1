import 'package:flutter/material.dart';
import 'package:learning_system/core/widgets/random_widget/requests_widget.dart';

class ScholarshipsRequestsPage extends StatelessWidget {
  const ScholarshipsRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RequestsWidget(title: "Name of Student", childCount: 10, confirmPress: () {  }, deletePress: () {  },),
    );
  }
}
