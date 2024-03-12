import 'package:flutter/material.dart';
import 'package:flutter_sign_in/login.dart';
import 'package:flutter_sign_in/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
      '/signup/': (context) => SignUp()
      },
    );
  }
}


