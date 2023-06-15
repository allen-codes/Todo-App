import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget todoPage() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    
                    tileColor: Colors.deepPurple.shade200,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                    title:  const Text(
                      "TITLE HERE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    subtitle: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      maxLines: 2,
                    ),
                    
                  ),
                );
              },
            ),
          ),
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
                "Recurring",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text("Ongoing",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))
            ],
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            labelStyle: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w900, letterSpacing: 4),
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
        body: TabBarView(children: [todoPage(), const Placeholder()]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
