import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo_model.dart';

class TodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<TodoModel>> getTodos() {
    final todosSnapshot = db.collection("todos").snapshots().map(
        (querySnapshot) => querySnapshot.docs
            .map(
                (doc) => TodoModel.fromJSON(doc.data() as Map<String, dynamic>))
            .toList());
    return todosSnapshot;
  }

  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      await db.collection("todos").add(todo);
      return "Successfully added a todo";
    } on FirebaseException catch (e) {
      return "Failed with error code: ${e.code}";
    }
  }

  Stream<List<TodoModel>> getFolderTodos(List<String> todoIDs) {
    final todoModels = db
        .collection("todos")
        .where(FieldPath.documentId, whereIn: todoIDs)
        .snapshots()
        .map((event) => event.docs
            .map((e) => TodoModel.fromJSON(e.data() as Map<String, dynamic>))
            .toList());
    return todoModels;
  }
}
