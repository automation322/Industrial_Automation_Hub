import 'package:automation_hub/utils/colors.dart';
import 'package:automation_hub/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'auth/view/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dashboard/view/dashboard.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shared_Preference.init();
  // initializing the firebase app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Industrial_Automation_Hub',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: ThemeColors.primaryColor,
        fontFamily: 'NotoSans-ExtraBold',
        textTheme: const TextTheme(
          headline2: TextStyle(
              fontFamily: "NotoSans-ExtraBold", fontSize: 16, color: Colors.amberAccent),
        ),
      ),
      home: LoaderOverlay(
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 250),
        child: Shared_Preference.getBool(SharedPreferenceKeys.isLogin) == true
            ? const Dashboard()
            : const LoginScreen(),
      ),
    );
  }
}
