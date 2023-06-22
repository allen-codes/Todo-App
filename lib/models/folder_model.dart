import 'package:cloud_firestore/cloud_firestore.dart';

class FolderModel {
  late String folderName;
  late DateTime dateCreated;
  late List<dynamic> todos;

  FolderModel(
      {required this.folderName,
      required this.dateCreated,
      required this.todos});

  factory FolderModel.fromJSON(Map<String, dynamic> folder) {
    

    return FolderModel(
      folderName: folder["folderName"],
      dateCreated: DateTime.fromMillisecondsSinceEpoch(
                (folder["dateCreated"] as Timestamp).millisecondsSinceEpoch),
      todos: folder["todos"] as List<dynamic>,
    );
  }
}
