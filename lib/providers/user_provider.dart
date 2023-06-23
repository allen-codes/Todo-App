import 'package:flutter/material.dart';
import 'package:todo_app/models/user_model.dart';

import '../apis/user_api.dart';

class UserProvider with ChangeNotifier {
  late UserAPI firebaseTodoService;
  late String currentUserID;
  late UserModel currentUser;

  Stream<UserModel> userStream = const Stream.empty();

  UserProvider() {
    firebaseTodoService = UserAPI();
  }

  Stream<UserModel> getUserStream() {
    print("STREAM: ${userStream.isEmpty}");
    return userStream;
  }

  void createUser(String id) {
    firebaseTodoService.createUser(id);
    currentUserID = id;
    notifyListeners();
  }

  void fetchUser() async {
    userStream = firebaseTodoService.getUser(currentUserID);
    notifyListeners();
  }

  void login(String id) async {
    currentUserID = id;
    currentUser = await firebaseTodoService.getUserModel(currentUserID);
    fetchUser();
  }

  void register(String id) async {
    currentUserID = id;
    currentUser = await firebaseTodoService.getUserModel(currentUserID);
    createUser(id);
    fetchUser();
  }
}
