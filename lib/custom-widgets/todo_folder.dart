import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/folder_model.dart';
import '../providers/folder_provider.dart';

class TodoFolder extends StatefulWidget {
  final FolderModel folder;
  const TodoFolder({super.key, required this.folder});

  @override
  State<TodoFolder> createState() => _TodoFolderState(folder: folder);
}

class _TodoFolderState extends State<TodoFolder> {
  FolderModel folder;
  Color favoritesColor = Colors.deepPurple.shade100;

  _TodoFolderState({required this.folder});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FolderProvider>().setFolderOnView(folder);
        Navigator.pushNamed(context, "/todos");
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 5),
        child: Card(
          color: Colors.deepPurple.shade200,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        if (favoritesColor == Colors.deepPurple.shade100) {
                          setState(() {
                            favoritesColor = Colors.deepPurple;
                          });
                        } else {
                          setState(() {
                            favoritesColor = Colors.deepPurple.shade100;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.star,
                        color: favoritesColor,
                      )),
                ),
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
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  folder.folderName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
