import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_getx_firebase/data/services/firebase_services.dart';
import '../../data/models/task_model.dart';

class PendingController extends GetxController {
  final Stream<QuerySnapshot> stream = FirebaseServices.getOngoingTask();

  final titleEditingController = TextEditingController();
  final descEditingController = TextEditingController();

  handleInputTask() async {
    TaskModel model = TaskModel(
      title: titleEditingController.text,
      description: descEditingController.text,
      isCompeleted: false,
    );
    await FirebaseServices.addTask(model: model);

    Get.back();
  }

  changeTaskStatus(String docRef) {
    return FirebaseServices.changeTaskStatus(id: docRef);
  }

  hadleEditTask(String id) async {
    if (titleEditingController.text.trim() == '' ||
        descEditingController.text.trim() == '') {
      Get.back();
      return;
    }

    TaskModel model = TaskModel(
      title: titleEditingController.text,
      description: descEditingController.text,
      isCompeleted: false,
    );

    await FirebaseServices.editTask(model: model, id: id);

    Get.back();
  }

  changeTextField(String title, String desc) {
    titleEditingController.value = TextEditingValue(text: title);
    descEditingController.value = TextEditingValue(text: desc);
  }
}
