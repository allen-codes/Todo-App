
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/custom-widgets/taskCard.dart';
import 'package:todo_app/models/todo_model.dart';


class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    List<TodoModel> todos = Provider.of<List<TodoModel>>(context);
    return Scaffold(
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
