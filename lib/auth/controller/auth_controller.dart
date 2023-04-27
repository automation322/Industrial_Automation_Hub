import 'package:flutter/cupertino.dart';

import '../../utils/custom_dialoge.dart';
import '../../utils/firebase_consts.dart';
import '../../utils/firebase_main.dart';

Future<bool> signup(BuildContext context) async {
  bool isSuccess = false;
  try {
    isSuccess = await FirebaseMain().googleLogin();
    if (isSuccess) {
      return isSuccess;
    }
  } catch (error) {
    if (error == FirebaseCollections.noInternetString) {
      CustomDialog().dialog(
          context: context,
          onPress: () {
            Navigator.pop(context);
            signup(context);
          },
          isCancelAvailable: true,
          successButtonName: "Retry",
          title: "No internet connection",
          content: "check your internet connectivity");
    }
  }
  return isSuccess;
}