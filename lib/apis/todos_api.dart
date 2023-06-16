import 'package:cloud_firestore/cloud_firestore.dart';

class TodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getTodos() {
    final entriesSnapshot = db
        .collection("todos")
        .snapshots();
        
    return entriesSnapshot;
  }
}