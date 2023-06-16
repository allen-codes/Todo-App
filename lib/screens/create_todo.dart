import 'package:flutter/material.dart';

class CreateToDo extends StatefulWidget {
  const CreateToDo({Key? key}) : super(key: key);

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  final key = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
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
                    
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "CREATE TODO",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton.filled(onPressed: () {}, icon: Icon(Icons.close),
                        color: Colors.deepPurple,
                        style: ButtonStyle(iconSize:  const MaterialStatePropertyAll(30), backgroundColor: MaterialStatePropertyAll(Colors.deepPurple.shade100)),)
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 1.75),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: TextFormField(
                      maxLength: 50,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple, width: 1.75),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    maxLines: 20,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Row(children: [
                      const Icon(Icons.date_range,
                        size: 30,
                        color: Colors.deepPurple,
                        shadows: [Shadow(color: Colors.black)]),
                    TextButton(
                      child: Text(
                        "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                    ],),
                    
                    Row(children: [
                      const Icon(Icons.alarm,
                        size: 30,
                        color: Colors.deepPurple,
                        shadows: [Shadow(color: Colors.black)]),

                    TextButton(
                      child: Text(
                        "${selectedTime.hour} : ${selectedDate.minute}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        final TimeOfDay? time = await showTimePicker(context: context, initialTime: selectedTime);
                        if (time != null) {
                          [
                            setState(() {
                              selectedTime = time;
                            })
                          ];
                        }
                      },
                    ),
                    ],)
                  ],
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {},
                  
                  child: const Text("ADD TODO"),
                  style: const ButtonStyle(
                      // shadowColor: MaterialStatePropertyAll(Colors.black),
                      
                      foregroundColor: MaterialStatePropertyAll(Colors.deepPurple),
                      elevation: MaterialStatePropertyAll(2),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
