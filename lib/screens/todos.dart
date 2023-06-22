import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom-widgets/taskCard.dart';
import 'package:todo_app/models/todo_model.dart';

import '../providers/folder_provider.dart';
import '../providers/todo_provider.dart';

class Todos extends StatefulWidget {
  Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {


  @override
  Widget build(BuildContext context) {
    context.watch<TodoProvider>().fetchFolderTodos(context.read<FolderProvider>().folderTodos());
    Stream<List<TodoModel>> todos = context.watch<TodoProvider>().todosInFolder;
    String folderName = context.watch<FolderProvider>().folderOnView.folderName;

    return StreamBuilder<Object>(
      stream: todos,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("An error has occured!"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        } else if (!snapshot.hasData) {
          return Center(
            child: Text("Has no date")
          );
        } 
        List<TodoModel> todos = snapshot.data as List<TodoModel>;
        // return Placeholder();
        return Scaffold(
          body: Container(
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
    );
  }
}
