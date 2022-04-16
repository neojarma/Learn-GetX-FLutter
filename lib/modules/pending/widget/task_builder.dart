import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx_firebase/modules/pending/widget/generate_bottom_modal.dart';
import '../controller.dart';

class TaskBuilder extends StatelessWidget {
  TaskBuilder({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(PendingController());

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
        List<Widget> result = [];
        for (var item in list) {
          final String title = item.get('title');
          final String description = item.get('description');
          final String key = item.id;

          result.add(ListTile(
            key: Key(key),
            title: Text(title),
            subtitle: Text(description),
            trailing: PopupMenuButton(
              onSelected: (value) {
                if (value == 'edit') {
                  GenerateBottomModal(
                    context,
                    title: 'Edit Task',
                    buttonText: 'Edit',
                    function: () async => await controller.hadleEditTask(key),
                    hintTitle: title,
                    hintDesc: description,
                  );
                  controller.changeTextField(title, description);
                }
                ;
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  // onTap: () => print('asd'),
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 16),
                      Text('Edit'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () async => await controller.changeTaskStatus(key),
                  child: Row(
                    children: [
                      Icon(Icons.done),
                      SizedBox(width: 16),
                      Text('Done'),
                    ],
                  ),
                )
              ],
            ),
          ));
        }

        return ListView(
          children: result,
        );
      },
    );
  }
}
