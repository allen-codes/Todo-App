import 'package:flutter/material.dart';

class TodoFolder extends StatefulWidget {
  const TodoFolder({super.key});

  @override
  State<TodoFolder> createState() => _TodoFolderState();
}

class _TodoFolderState extends State<TodoFolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        color: Colors.deepPurple.shade200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.deepPurple,
                ),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: "edit",
                      child: Text("Edit"),
                    ),
                    const PopupMenuItem(
                        value: "favorites", child: Text("Add to Favorites")),
                    const PopupMenuItem(
                      value: "archive",
                      child: Text("Archive"),
                    ),
                    const PopupMenuItem(
                      value: "delete",
                      child: Text("Delete"),
                    ),
                  ];
                }),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "TITLE HERE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
