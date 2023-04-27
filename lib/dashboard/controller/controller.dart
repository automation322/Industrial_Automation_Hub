import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../auth/view/login.dart';
import '../../utils/custom_dialoge.dart';
import '../../utils/firebase_consts.dart';
import '../../utils/firebase_main.dart';
import '../../utils/shared_preference.dart';

class DashboardController {
  Future<void> signout(BuildContext context) async {
    bool isSuccess = false;
    try {
      isSuccess = await FirebaseMain().googleLogout();
      if (isSuccess) {
        Shared_Preference.setBool(SharedPreferenceKeys.isLogin, false);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      }
    } catch (error) {
      if (error == FirebaseCollections.noInternetString) {
        CustomDialog().dialog(
            context: context,
            onPress: () {
              Navigator.pop(context);
              signout(context);
            },
            isCancelAvailable: true,
            successButtonName: "Retry",
            title: "No internet connection",
            content: "check your internet connectivity");
      }
    }
  }
}