import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom-widgets/taskCard.dart';
import 'package:todo_app/models/todo_model.dart';

import '../providers/folder_provider.dart';

class Todos extends StatefulWidget {
  Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  

  @override
  Widget build(BuildContext context) {
    String folderName = context.watch<FolderProvider>().folderOnView;
    List<TodoModel> allTodos = Provider.of<List<TodoModel>>(context);
    List<TodoModel> todos  = [];
    for (TodoModel todo in allTodos) {
      print("${todo.folderName} : ${folderName}");
      if (todo.folderName == folderName){
        todos.add(todo);
      }
    }
    return Scaffold(
      body: (todos.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "TODOS",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      )),
                  Expanded(
                    child: ListView.builder(
                        // physics: AlwaysScrollableScrollPhysics(),
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          TodoModel todo = todos[index];
                          return Todocard(index: index, todo: todo);
                        }),
                  )
                ],
              ),
            ),
    );
  }
}
