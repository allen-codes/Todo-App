import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_todo.dart';
import 'package:todo_app/screens/homepage.dart';
import 'package:todo_app/screens/signin.dart';

void main() {
  runApp(const MyApp());
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
        "/" : (context) => const SignIn(),
        "/homepage" : (context) => const HomePage(),
        "/create-todo" : (context) => const CreateToDo(),
        "/edit-todo" : (context) => EditTodo(),
      }
    );
  }
}
