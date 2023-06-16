import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  late String title;
  late String description;
  late DateTime? duedate;
  late String folderName;
  late bool? isActive;

  TodoModel(
      {required this.title,
      required this.folderName,
      required this.description,
      this.duedate,
      this.isActive});

  factory TodoModel.fromJSON(Map<String, dynamic> todo) {
    return TodoModel(
        title: todo["title"],
        description: todo["description"],
        duedate: DateTime.fromMillisecondsSinceEpoch(
                (todo["duedate"] as Timestamp).millisecondsSinceEpoch),
        folderName: todo["folderName"],
        isActive: todo["isActive"]);
  }
}
