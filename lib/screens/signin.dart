import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signInKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailUsernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;

    PageController _pageController = PageController();

    Widget SignInPage() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: signInKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("LogIn Email/Username")),
                    textAlign: TextAlign.center,
                    controller: emailUsernameController,
                    validator: (value) {
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!) ||
                          value.isEmpty) {
                        return ("Please enter a valid email");
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(label: Text("Password")),
                    textAlign: TextAlign.center,
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: const EdgeInsets.all(17),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("SIGN IN")))
                ],
              )),
        ],
      );
    }

    Widget SignUpPage() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: signUpKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(label: Text("Name")),
                    textAlign: TextAlign.center,
                    controller: nameController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a valid name";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Age")),
                    textAlign: TextAlign.center,
                    controller: ageController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a valid age";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Email")),
                    textAlign: TextAlign.center,
                    controller: emailUsernameController,
                    validator: (value) {
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!) ||
                          value.isEmpty) {
                        return ("Please enter a valid email");
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("Password")),
                    textAlign: TextAlign.center,
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a password";
                      }
                      return null;
                    },
                  ),
                  Container(
                      margin: const EdgeInsets.all(17),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("SIGN UP")))
                ],
              )),
        ],
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text(
                "TODO APP",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 10,
                width: width / 1.5,
                color: Colors.red,
                margin: EdgeInsets.fromLTRB(0, width / 15, 0, 0),
              ),
              Container(
                height: heigth / 1.5,
                width: width / 1.5,
                margin:
                    EdgeInsets.fromLTRB(width / 10, 0, width / 10, width / 10),
                padding: EdgeInsets.all(width / 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(20, 20),
                      bottomRight: Radius.elliptical(20, 20)),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: width / 4.5,
                            padding: EdgeInsets.all(8),
                            color: Colors.red,
                            child: const Text(
                              "Sign In",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            _pageController.animateToPage(
                              0, // Index of the desired page
                              duration: const Duration(
                                  milliseconds:
                                      300), // Animation duration (optional)
                              curve: Curves.bounceIn,
                              // Animation curve (optional)
                            );
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: width / 4.5,
                            padding: const EdgeInsets.all(8),
                            color: Colors.orange,
                            child: const Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            _pageController.animateToPage(
                              1, // Index of the desired page
                              duration: const Duration(
                                  milliseconds:
                                      300), // Animation duration (optional)
                              curve:
                                  Curves.bounceIn, // Animation curve (optional)
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        children: [SignInPage(), SignUpPage()],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
