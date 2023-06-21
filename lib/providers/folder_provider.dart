import 'package:flutter/material.dart';

import '../apis/folders_api.dart';
import '../models/folder_model.dart';

class FolderProvider with ChangeNotifier{
  late FolderAPI firebaseTodoService;
  Stream<List<FolderModel>> _foldersStream = const Stream.empty();
  String folderOnViewed = "";

  Stream<List<FolderModel>> get foldersStream => _foldersStream;
  String get folderOnView => folderOnViewed;

  FolderProvider(){
    firebaseTodoService = FolderAPI();
    fetchFolders();
  }

  void fetchFolders() {
    _foldersStream = firebaseTodoService.getFolders();
    notifyListeners();
  }

  void setFolderOnView(String folderName) {
    folderOnViewed = folderName;
  }
}