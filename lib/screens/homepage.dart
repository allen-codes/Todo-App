import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/custom-widgets/todo_folder.dart';
import 'package:todo_app/models/folder_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget todoPage(BuildContext context) {
    List<FolderModel> folders = Provider.of<List<FolderModel>>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
              child: GridView.builder(
            itemCount: folders.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return TodoFolder(
                folder: folders[index],
              );
            },
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade500,
          bottom: const TabBar(
            tabs: [
              Text(
                "Active",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text("Favorites",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
            ],
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            labelStyle: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.w900,
                letterSpacing: 4),
            labelPadding: EdgeInsets.all(8.0),
          ),
        ),
        drawer: Drawer(
          child: ListView(children: const [
            DrawerHeader(
              child: Center(
                  child: Text(
                "TODO APP",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            )
          ]),
        ),
        body: TabBarView(children: [todoPage(context), const Placeholder()]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/create-todo");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
