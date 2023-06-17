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
}
