import 'package:flutter/material.dart';

class TodosInFolder extends StatefulWidget {
  final List<String> folderTodos;
  const TodosInFolder({super.key, required this.folderTodos});

  @override
  State<TodosInFolder> createState() => _TodosInFolderState(folderTodos: folderTodos);
}

class _TodosInFolderState extends State<TodosInFolder> {
  final List<String> folderTodos;

  _TodosInFolderState({required this.folderTodos});

  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
      Text("")
    ],);
  }
}