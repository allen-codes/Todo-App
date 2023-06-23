import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> createUser(String id) async {
    try {
      await db.collection("users").doc(id).set({'folders': []});
      return "Success";
    } catch (e) {
      return "Failed";
    }
  }

  Stream<UserModel> getUser(String id) {
    final userStream = db.collection('users').doc(id).snapshots().map((event) => UserModel.fromJSON(event.data() as Map<String, dynamic>));
    return userStream;
  }
}