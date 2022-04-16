import 'package:flutter/material.dart';
import 'package:todo_getx_firebase/modules/completed/widget/task_builder.dart';

class CompletedPage extends StatelessWidget {
  CompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompletedTaskBuilder(),
    );
  }
}
