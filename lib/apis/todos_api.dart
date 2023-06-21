import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo_model.dart';

class TodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<TodoModel>> getTodos() {
    final todosSnapshot = db
    .collection("todos")
    .snapshots()
    .map((querySnapshot) => querySnapshot.docs
        .map((doc) => TodoModel.fromJSON(doc.data() as Map<String, dynamic>))
        .toList());

  return todosSnapshot;
  }

  Stream<List<TodoModel>> getTodosInFolder(List<String> todoIDs) {
  return db
      .collection("todos")
      .where(FieldPath.documentId, whereIn: todoIDs)
      .snapshots()
      .map((querySnapshot) {
    final todoModelsinFolder = <TodoModel>[];

    for (final docSnapshot in querySnapshot.docs) {
      final todoJSON = docSnapshot.data() as Map<String, dynamic>;
      final todoModel = TodoModel.fromJSON(todoJSON);
      todoModelsinFolder.add(todoModel);
    }

    return todoModelsinFolder;
  });
}

}