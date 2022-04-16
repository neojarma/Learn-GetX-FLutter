import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseProvider {
  static final firebaseInstance =
      FirebaseFirestore.instance.collection('todo-list');
}
