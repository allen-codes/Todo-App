
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/folder_model.dart';



class CreateToDo extends StatefulWidget {
  const CreateToDo({Key? key}) : super(key: key);

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  final key = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Widget titleField() {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 1.75),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          maxLength: 50,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  Widget descriptionField() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 1.75),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        maxLength: 200,
        maxLines: 5,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget dateField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Icon(Icons.date_range,
                size: 20,
                color: Colors.deepPurple,
                shadows: [Shadow(color: Colors.black)]),
            TextButton(
              child: Text(
                "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000));
                if (dateTime != null) {
                  [
                    setState(() {
                      selectedDate = dateTime;
                    })
                  ];
                }
              },
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.alarm,
                size: 20,
                color: Colors.deepPurple,
                shadows: [Shadow(color: Colors.black)]),
            TextButton(
              child: Text(
                "${selectedTime.hour} : ${selectedDate.minute}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                final TimeOfDay? time = await showTimePicker(
                    context: context, initialTime: selectedTime);
                if (time != null) {
                  [
                    setState(() {
                      selectedTime = time;
                    })
                  ];
                }
              },
            ),
          ],
        )
      ],
    );
  }

  Widget addTodoButton() {
    return ElevatedButton(
      
      onPressed: () {},
      child: const Text("ADD TODO", style: TextStyle(fontSize: 15)),
      style: const ButtonStyle(
          // shadowColor: MaterialStatePropertyAll(Colors.black),
          
          foregroundColor: MaterialStatePropertyAll(Colors.deepPurple),
          elevation: MaterialStatePropertyAll(2),
          textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
    );
  }

  Widget mainPage(List<FolderModel> folders) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: key,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "CREATE TODO",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Row(
                          children: [
                            Text(
                              "Folder Name: ",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                            TextButton(
                              child: const Text("folder name"),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Select Folder'),
                                      content: SingleChildScrollView(
                                        child: SizedBox(
                                          height: MediaQuery.of(context).size.height/2,
                                          width: MediaQuery.of(context).size.width/1.5,
                                          child: ListView.builder(
                                              itemCount: folders.length,
                                              itemBuilder: (context, index) {
                                                return TextButton(
                                                  child: Text(folders[index]
                                                      .folderName),
                                                  onPressed: () {
                                                    print(folders[index].todos);
                                                  },
                                                );
                                              }),
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Close the dialog
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton.filled(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.deepPurple,
                      style: ButtonStyle(
                          iconSize: const MaterialStatePropertyAll(30),
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.deepPurple.shade100)),
                    ),
                  ],
                ),
                titleField(),
                descriptionField(),
                dateField(),
                SizedBox(
                  height: 10,
                ),
                addTodoButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    List<FolderModel> folders =Provider.of<List<FolderModel>>(context);
    return mainPage(folders);
  }
}
