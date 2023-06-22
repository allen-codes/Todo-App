import 'package:flutter/material.dart';

import '../apis/todos_api.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier{
  late TodoAPI firebaseTodoService;
  Stream<List<TodoModel>> _todosStream = const Stream.empty();
  Stream<List<TodoModel>> _todosInFolderStream = const Stream.empty();

  Stream<List<TodoModel>> get todosStream => _todosStream;
  Stream<List<TodoModel>> get todosInFolder => _todosInFolderStream;

  TodoProvider(){
    firebaseTodoService = TodoAPI();
    fetchTodos();
  }

  void fetchFolderTodos(List<String> todoIDs) {
    _todosInFolderStream = firebaseTodoService.getFolderTodos(todoIDs);
  }

  void fetchTodos() {
    _todosStream = firebaseTodoService.getTodos();
    notifyListeners();
  }

  void deleteTodo(String todoID) {
    firebaseTodoService.deleteEntry(todoID);
    notifyListeners();
  }

  void addTodo(String title, String description, DateTime? duedate, String folderName, bool? isActive) async {
    Map<String, dynamic> newTodo = {
      "title" : title,
      "description" : description,
      "duedate" : duedate,
      "folderName" : folderName,
      "isActive" : isActive
    };

    await firebaseTodoService.addTodo(newTodo);
  }

}