import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

class CompletedTaskBuilder extends StatelessWidget {
  CompletedTaskBuilder({Key? key}) : super(key: key);

  final controller = Get.put(CompletedController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }

        final list = snapshot.data!.docs;
        final List<ListTile> result = [];

        for (var item in list) {
          final String title = item.get('title');
          final String description = item.get('description');

          result.add(
            ListTile(
              title: Text(title),
              subtitle: Text(description),
            ),
          );
        }

        return ListView(
          children: result,
        );
      },
    );
  }
}
