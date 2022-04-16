import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

final controller = Get.find<PendingController>();

Future<dynamic> GenerateBottomModal(
  BuildContext context, {
  required String title,
  required String buttonText,
  required Future<dynamic> function(),
  String? hintTitle,
  String? hintDesc,
}) {
  // clear the text field
  controller.titleEditingController.clear();
  controller.descEditingController.clear();

  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            Text(title),
            SizedBox(
              height: 13,
            ),
            TextField(
              controller: controller.titleEditingController,
              decoration: InputDecoration(
                hintText: hintTitle ?? 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            TextField(
              controller: controller.descEditingController,
              decoration: InputDecoration(
                hintText: hintDesc ?? 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async => await function(),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      );
    },
  );
}
