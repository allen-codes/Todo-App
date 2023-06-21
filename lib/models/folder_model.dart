import 'package:cloud_firestore/cloud_firestore.dart';

class FolderModel {
  late String folderName;
  late DateTime dateCreated;

  FolderModel(
      {required this.folderName,
      required this.dateCreated,});

  factory FolderModel.fromJSON(Map<String, dynamic> folder) {
    

    return FolderModel(
      folderName: folder["folderName"],
      dateCreated: DateTime.fromMillisecondsSinceEpoch(
                (folder["dateCreated"] as Timestamp).millisecondsSinceEpoch),
    );
  }
}
