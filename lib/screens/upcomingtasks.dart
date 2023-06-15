import 'package:flutter/material.dart';

class UpcomingTasks extends StatefulWidget {
  const UpcomingTasks({super.key});

  @override
  State<UpcomingTasks> createState() => _UpcomingTasksState();
}

class _UpcomingTasksState extends State<UpcomingTasks> {
  @override
  Widget build(BuildContext context) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "TITLE",
                                      style: TextStyle(
                                        
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      child: Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.deepPurple,
                                          child: const Text(
                                            "YYYY-MM-DD",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ]),
                              subtitle: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("subtitle"),
                                  ])),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10)),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 1.5,
                                            color: Colors.deepPurple.shade400)),
                                    color: Colors.deepPurple,
                                  ),
                                  child: TextButton(
                                    child: const Text("DONE",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    onPressed: () {},
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10)),
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              width: 1.5,
                                              color:
                                                  Colors.deepPurple.shade400)),
                                      color: Colors.deepPurple,
                                    ),
                                    child: TextButton(
                                        child: const Text("DELETE",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        onPressed: () {})),
                              ))
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
