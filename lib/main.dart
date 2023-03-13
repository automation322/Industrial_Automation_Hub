import 'package:flutter/material.dart';
import 'auth/view/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing the firebase app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Industrial_Automation_Hub',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Login()
    );
  }
}

