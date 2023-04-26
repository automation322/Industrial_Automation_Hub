// function to implement the google signin

// creating firebase instance
import 'package:automation_hub/auth/model/logged_in_user_model.dart';
import 'package:automation_hub/dashboard/view/dashboard.dart';
import 'package:automation_hub/utils/firebase_consts.dart';
import 'package:automation_hub/utils/shared_preference.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<bool> signup(BuildContext context) async {
  bool isSuccess = false;
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      // User? user = result.user;

      LoggedInUserModel loginUser = LoggedInUserModel();
      loginUser.id = result.user?.uid ?? "";
      loginUser.name = result.user?.displayName ?? "";
      loginUser.email = result.user?.email ?? "";
      loginUser.profilePicture = result.user?.photoURL ?? "";
      loginUser.createdAt = DateTime.now().toString();

      CollectionReference users =
          FirebaseFirestore.instance.collection(FirebaseCollections.userCollection);


      users.doc(result.user?.uid).set(loginUser.toJson());


      if (result != null) {
        isSuccess = true;
      }
    }
  } catch (error) {
    isSuccess = false;
    print(error.toString());
  }

  return isSuccess;
}
