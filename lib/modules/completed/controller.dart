import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_getx_firebase/data/services/firebase_services.dart';

class CompletedController extends GetxController {
  final Stream<QuerySnapshot> stream = FirebaseServices.getCompletedTask();
}
