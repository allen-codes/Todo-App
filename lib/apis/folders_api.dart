import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/folder_model.dart';

class FolderAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<List<FolderModel>> getFolders() {
    final entriesSnapshot = db.collection("folders").snapshots().map(
        (querySnapshot) => querySnapshot.docs
            .map((doc) =>
                FolderModel.fromJSON(doc.data() as Map<String, dynamic>))
            .toList());

    return entriesSnapshot;
  }

  Stream<List<FolderModel>> getUserFolders(List<dynamic> folderIDs) {
    final folderSnapshot = (folderIDs.isEmpty) ? Stream<List<FolderModel>>.fromIterable([[]]) : db
        .collection("folders")
        .where(FieldPath.documentId, whereIn: folderIDs)
        .snapshots()
        .map((event) => event.docs
            .map((e) => FolderModel.fromJSON(e.data() as Map<String, dynamic>))
            .toList());
    return folderSnapshot;
  }

  // void updateTodoIDS(List<String> todoIDs) {
  //   db.collection("folders").doc().update({'todos': todoIDs });
  // }
}
