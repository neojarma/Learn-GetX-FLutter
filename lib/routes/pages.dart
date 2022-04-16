import 'package:get/get.dart';
import 'package:todo_getx_firebase/modules/completed/page.dart';
import 'package:todo_getx_firebase/modules/dashboard/page.dart';
import 'package:todo_getx_firebase/modules/pending/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
    ),
    GetPage(
      name: Routes.pending,
      page: () => PendingPage(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => CompletedPage(),
    )
  ];
}
