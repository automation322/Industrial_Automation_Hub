import 'dart:core';
import 'package:automation_hub/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../dashboard/view/dashboard.dart';
import '../../utils/colors.dart';
import '../../utils/shared_preference.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAgreeTc = false;
  double height = 0.0;
  double width = 0.0;
  bool _loding = false;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/app_icon_splash/icon_one.jpg", fit: BoxFit.fill),
          Row(
            children: [
              Checkbox(
                  value: isAgreeTc,
                  activeColor: ThemeColors.checkBoxActiveColor,
                  onChanged: (value) {
                    setState(() {
                      isAgreeTc = !isAgreeTc;
                    });
                  }),
              SizedBox(
                width: width / 1.3,
                child: const Text(
                  "I agree the Terms&Condition of the application",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          const SizedBox(height: 50),
          _loding == true
              ? CircularProgressIndicator(
                  color: ThemeColors.Primarycolor,
                )
              : ElevatedButton.icon(
                  icon: const Icon(Icons.login),
                  label: const Text("Login with Google"),
                  style: ElevatedButton.styleFrom(
                    maximumSize: Size(width / 1.4, height * 0.09),
                  ),
                  onPressed: isAgreeTc == true
                      ? () async {
                          setState(() {
                            _loding = true;
                          });
                          bool isLogin = false;
                          isLogin = await signup(context);
                          if (isLogin == true) {
                            Shared_Preference.setBool(
                                SharedPreferenceKeys.isLogin, true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()));
                            setState(() {
                              _loding = false;
                            });
                          }
                        }
                      : null,
                )
        ],
      ),
    );
  }
}
