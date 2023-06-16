import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/screens/create_todo.dart';
import 'package:todo_app/screens/edit_todo.dart';
import 'package:todo_app/screens/homepage.dart';
import 'package:todo_app/screens/signin.dart';
import 'package:todo_app/screens/todos.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => TodoProvider(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorLight: Color.fromARGB(255, 158, 240, 26),
          primaryColor: const Color.fromARGB(255, 0, 128, 0),
          primaryColorDark: const Color.fromARGB(255, 0, 75, 35),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/homepage",
        routes: {
          "/": (context) => const SignIn(),
          "/homepage": (context) => const HomePage(),
          "/create-todo": (context) => const CreateToDo(),
          "/edit-todo": (context) => const EditTodo(),
          "/todos": (context) => const Todos(),
        });
  }
}
