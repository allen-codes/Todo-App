import 'package:flutter/material.dart';

import '../apis/folders_api.dart';
import '../models/folder_model.dart';

class FolderProvider with ChangeNotifier{
  late FolderAPI firebaseTodoService;
  Stream<List<FolderModel>> _foldersStream = const Stream.empty();
  Stream<List<FolderModel>> _userFolderStream = const Stream.empty();
  late FolderModel folderOnViewed;


  Stream<List<FolderModel>> get foldersStream => _foldersStream;
  Stream<List<FolderModel>> get userFolderStream => _userFolderStream;
  FolderModel get folderOnView => folderOnViewed;

  FolderProvider(){
    firebaseTodoService = FolderAPI();
    fetchFolders();
  }

  void fetchFolders() {
    _foldersStream = firebaseTodoService.getFolders();
    notifyListeners();
  }

  void fetchUserFolders(List<dynamic>? folderIDs) {
    _userFolderStream = firebaseTodoService.getUserFolders(folderIDs!);
  }

  void setFolderOnView(FolderModel folder) {
    folderOnViewed = folder;
  }

  List<String> folderTodos() {
    List<String> folderTodoIDs= []; 
    for (String ID in folderOnViewed.todos){
      folderTodoIDs.add(ID);
    }
    return folderTodoIDs;
  }
}