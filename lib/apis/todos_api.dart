import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo_model.dart';

class TodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<TodoModel>> getTodos() {
    final entriesSnapshot = db
    .collection("todos")
    .snapshots()
    .map((querySnapshot) => querySnapshot.docs
        .map((doc) => TodoModel.fromJSON(doc.data() as Map<String, dynamic>))
        .toList());

  return entriesSnapshot;
  }
}