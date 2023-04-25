import 'package:automation_hub/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isAgreeTc = false;
  double height = 0.0;
  double width = 0.0;
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
              Container(
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: Size(width / 1.5, height * 0.06),
              ),
              onPressed: isAgreeTc == true
                  ? () {
                      signup(context);
                    }
                  : null,
              child: const Text("Login with Google"))
        ],
      ),
    );
  }
}
