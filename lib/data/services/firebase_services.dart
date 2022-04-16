import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_getx_firebase/data/models/task_model.dart';
import 'package:todo_getx_firebase/data/provider/firebase.dart';

abstract class FirebaseServices {
  static final firebaseConnection = FirebaseProvider.firebaseInstance;

  static addTask({TaskModel? model}) async {
    if (model == null) return;
    await firebaseConnection
        .add({
          'title': model.title,
          'description': model.description,
          'isCompleted': model.isCompeleted,
        })
        .then((value) => print('Data successfully recorded'))
        .catchError((err) => print('Failed to save'));
  }

  static editTask({TaskModel? model, String? id}) async {
    if (model == null || id == null) return;
    await firebaseConnection
        .doc(id)
        .update({
          'title': model.title,
          'description': model.description,
          'isCompleted': model.isCompeleted,
        })
        .then((value) => print('Successfully updated'))
        .catchError((err) => print('Failed to update data'));
  }

  static Stream<QuerySnapshot> getOngoingTask() {
    return firebaseConnection
        .where('isCompleted', isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot> getCompletedTask() {
    return firebaseConnection
        .where(
          'isCompleted',
          isEqualTo: true,
        )
        .snapshots();
  }

  static changeTaskStatus({String? id}) async {
    if (id == null) return;
    await firebaseConnection
        .doc(id)
        .update({'isCompleted': true})
        .then((value) => print('Successfully updated'))
        .catchError((err) => print('failed to update'));
  }
}
