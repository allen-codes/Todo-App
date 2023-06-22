import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo_model.dart';
import '../providers/todo_provider.dart';


class Todocard extends StatefulWidget {
  final int index;
  final TodoModel todo;
  final String todoID;
  const Todocard({super.key, required this.index, required this.todo, required this.todoID});
  

  @override
  State<Todocard> createState() => _TodocardState(index: index, todo: todo, todoID: todoID);
}

class _TodocardState extends State<Todocard> {
  Color hoveredOnDone = Colors.deepPurple;
  Color hoveredOnDelete = Colors.deepPurple;
  final int index;
  final TodoModel todo;
  final String todoID;

  _TodocardState({required this.index, required this.todo, required this.todoID});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListTile(
              tileColor: Colors.deepPurple.shade100,
              contentPadding: const EdgeInsets.all(10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(todo.folderName,
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold)),
                        const Text(" : ",
                            style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold)),
                        Text(
                          todo.title,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.deepPurple,
                          child: Text(
                            "${todo.duedate!.year}-${todo.duedate!.month}-${todo.duedate!.day}",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          )),
                    ),
                  ]),
              subtitle: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(todo.description),
              ])),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Row(
            children: [
              Expanded(
                  child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            width: 1.5, color: Colors.deepPurple.shade400)),
                    color: hoveredOnDone,
                  ),
                  child: TextButton(
                    child: const Text("DONE",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                     
     
                    },
                     onHover: (value) {
                        if (value) {
                          setState(() {
                            hoveredOnDone = Colors.deepPurpleAccent;
                          });
                        } else {
                          setState(() {
                            hoveredOnDone = Colors.deepPurple;
                          });
                        }
                      },
                  ),
                ),
              )),
              Expanded(
                  child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(10)),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              width: 1.5, color: Colors.deepPurple.shade400)),
                      color: hoveredOnDelete,
                    ),
                    child: TextButton(
                      child: const Text("DELETE",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onPressed: () {
                         showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Delete Todo'),
                                      content: const Text("Are you sure you want to delete this todo?"),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Close the dialog
                                            Navigator.pop(context);
                                            context.read<TodoProvider>().deleteTodo(todoID);
                                          },
                                          child: const Text("YES"),
                                        ),
                                        ElevatedButton(onPressed: () {
                                          Navigator.pop(context);
                                          
                                        }, child: const Text("No"))
                                      ],
                                    );
                                  },
                                );
                      },
                      onHover: (value) {
                        if (value) {
                          setState(() {
                            hoveredOnDelete = Colors.deepPurpleAccent;
                          });
                        } else {
                          setState(() {
                            hoveredOnDelete = Colors.deepPurple;
                          });
                        }
                      },
                    )),
              ))
            ],
          ),
        )
      ],
    );
  }
}
