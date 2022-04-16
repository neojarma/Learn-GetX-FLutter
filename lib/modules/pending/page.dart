import 'package:flutter/material.dart';
import 'package:todo_getx_firebase/modules/pending/widget/task_builder.dart';
import './widget/float_action_button.dart';

class PendingPage extends StatelessWidget {
  PendingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskBuilder(),
      floatingActionButton: FloatActionButton(),
    );
  }
}
