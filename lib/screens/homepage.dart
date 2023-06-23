import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/custom-widgets/todo_folder.dart';
import 'package:todo_app/models/folder_model.dart';

import '../models/user_model.dart';
import '../providers/folder_provider.dart';
import '../providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget todoPage(BuildContext context, List<FolderModel> folders) {
    return (folders.isEmpty) ? const Center(child: Text("No Existing Folders", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)): Container(
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

  Widget TabsWidget(List<FolderModel> folders) {
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
                body: TabBarView(children: [todoPage(context, folders), const Placeholder()]),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/create-todo");
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    Stream<UserModel> userStream = context.watch<UserProvider>().getUserStream();
    return StreamBuilder<Object>(
      stream: userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const Center(child: Text("An error has occured"),);
        } else if (snapshot.hasData == false){
          return SignInScreen(
              providers: [EmailAuthProvider(), PhoneAuthProvider()],
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/');
                }),
                AuthStateChangeAction<UserCreated>((context, state) {
                  Navigator.pushReplacementNamed(context, '/');
                }),
              ],
            );
        }
        context.read<FolderProvider>().fetchUserFolders(context.read<UserProvider>().currentUser.folders);
        Stream<List<FolderModel>> foldersStream = context.watch<FolderProvider>().userFolderStream;
        return StreamBuilder<List<FolderModel>>(
          stream: foldersStream,
          builder: (context, folderSnapshot) {
            if (folderSnapshot.hasError) {
              return const Center(child: Text("An error has occured"));
            } else if (folderSnapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            } else if (folderSnapshot.hasData == false) {
              return const Center(child: Text("No data"),);
            }
            return TabsWidget(folderSnapshot.data as List<FolderModel>);
          }
        );
      }
    );
  }
}
