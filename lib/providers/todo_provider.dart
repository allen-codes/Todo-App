import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../apis/todos_api.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier{
  late TodoAPI firebaseTodoService;
  Stream<QuerySnapshot> _todosStream = const Stream.empty();

  Stream<QuerySnapshot> get todosStream => _todosStream;

  TodoProvider(){
    firebaseTodoService = TodoAPI();
    fetchTodos();
  }

  void fetchTodos() {
    _todosStream = firebaseTodoService.getTodos();
    print(_todosStream.first);
    notifyListeners();
  }
}