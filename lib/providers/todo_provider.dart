import 'package:flutter/material.dart';

import '../apis/todos_api.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier{
  late TodoAPI firebaseTodoService;
  Stream<List<TodoModel>> _todosStream = const Stream.empty();

  Stream<List<TodoModel>> get todosStream => _todosStream;

  TodoProvider(){
    firebaseTodoService = TodoAPI();
    fetchTodos();
  }

  void fetchTodos() {
    _todosStream = firebaseTodoService.getTodos();
    notifyListeners();
  }
}