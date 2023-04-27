import 'package:automation_hub/utils/colors.dart';
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
        brightness: Brightness.light,
        primaryColor: ThemeColors.Primarycolor,
        fontFamily: "NotoSans-ExtraBold",
        textTheme: const TextTheme(
          headline2: TextStyle(fontFamily: "NotoSans-ExtraBold",fontSize: 16,color: Colors.amberAccent)
        )
      ),
      home: const Login()
    );
  }
}

