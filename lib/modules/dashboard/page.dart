import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx_firebase/modules/completed/page.dart';
import 'package:todo_getx_firebase/modules/dashboard/controller.dart';
import 'package:todo_getx_firebase/modules/pending/page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List App with Firebase'),
        centerTitle: true,
      ),
      body: Obx(
        () => IndexedStack(
          index: dashboardController.currentIndex.value,
          children: [
            PendingPage(),
            CompletedPage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: dashboardController.currentIndex.value,
          onTap: (value) => dashboardController.changePage(value),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: 'Pending Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Completed Task',
            ),
          ],
        ),
      ),
    );
  }
}
