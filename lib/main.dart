import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/folder_provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/providers/user_provider.dart';
import 'package:todo_app/screens/create_todo.dart';
import 'package:todo_app/screens/edit_todo.dart';
import 'package:todo_app/screens/homepage.dart';
import 'package:todo_app/screens/todos.dart';

import 'firebase_options.dart';
import 'models/folder_model.dart';
import 'models/todo_model.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => TodoProvider(),
      ),
      ChangeNotifierProvider(create: (context) => FolderProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider())
      // StreamProvider<Query
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<TodoModel>>.value(
          value: context.watch<TodoProvider>().todosStream,
          initialData: const [],
        ),
        StreamProvider<List<FolderModel>>.value(
          value: context.watch<FolderProvider>().foldersStream,
          initialData: const [],
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColorLight: const Color.fromARGB(255, 158, 240, 26),
          primaryColor: const Color.fromARGB(255, 0, 128, 0),
          primaryColorDark: const Color.fromARGB(255, 0, 75, 35),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/signin",
        routes: {
          "/signin": (context) {
            return SignInScreen(
              providers: [EmailAuthProvider(), PhoneAuthProvider()],
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/');
                  context.read<UserProvider>().login(state.user!.uid);
                }),
                AuthStateChangeAction<UserCreated>((context, state) {
                  Navigator.pushReplacementNamed(context, '/');
                  context
                      .read<UserProvider>()
                      .register(state.credential.user!.uid);
                }),
              ],
            );
          },
          "/": (context) => const HomePage(),
          "/create-todo": (context) => const CreateToDo(),
          "/edit-todo": (context) => const EditTodo(),
          "/todos": (context) => Todos(),
        },
      ),
    );
  }
}
