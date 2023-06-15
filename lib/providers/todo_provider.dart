import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier{
  List<TodoModel> todoList = [
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
    TodoModel(title: "COOKING PASTA", folderName: "Household Chores", duedate: DateTime(2022, 9, 7), description: "Some sweet pasta for today's celebration"),
  ];

  List<TodoModel> get getTodos => todoList;
}