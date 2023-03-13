import 'package:automation_hub/dashboard/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("welcome to dashboard")),
          IconButton(onPressed: (){
            signout(context);
           }, icon: Icon(Icons.logout))
        ]
    ));
  }
}
