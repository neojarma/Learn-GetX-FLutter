import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
import 'generate_bottom_modal.dart';

class FloatActionButton extends Container {
  final controller = Get.find<PendingController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        GenerateBottomModal(
          context,
          title: 'Add New Task',
          buttonText: 'Add Task',
          function: () async => await controller.handleInputTask(),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
