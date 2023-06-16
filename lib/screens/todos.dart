import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom-widgets/taskCard.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_provider.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> todosStream =
        context.watch<TodoProvider>().todosStream;
    return StreamBuilder(
      stream: todosStream,
      builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Center(
          child: Text("Error encountered! ${snapshot.error}"),
        );
      } else if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (!snapshot.hasData) {
        return const Placeholder(color: Colors.red,);
      } else {
        return Scaffold(
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.builder(
                      // physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        TodoModel todo = TodoModel(
                            title: "aaa",
                            folderName: "hhh",
                            description: "ggg");
                        return Todocard(index: index, todo: todo);
                      }),
                )
              ],
            ),
          ),
        );
        ;
      }
    });
  }
}
