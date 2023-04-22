import 'package:flutter/material.dart';

import 'banner_Widget.dart';

class HomeScreen extends StatefulWidget {
const HomeScreen({Key? key}) : super(key: key);

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("welcome", style: Theme.of(context).textTheme.headline2,),
),
drawer: Drawer(
child: ListView(
children: [
Container(
  height: MediaQuery.of(context).size.height * 0.250,
  //color: Colors.blue,
  alignment: Alignment.center,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
            Container(
          width: 70,
          height: 70,
                        child: ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(50)),
              clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                "assets/images/profile_pic.jpeg",
                fit: BoxFit.fill,
              ))),
                const SizedBox(
        height: 10,
      ),
                 Text(
        "dhruvik",
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(fontSize: 14, color: Colors.black),
      ),
              Text(
        "dhruvikchovatiya013@gmail.com",
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(fontSize: 14, color: Colors.black),
              ),
  ]),
),
      Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            ListTile(
              leading: Icon(Icons.gavel),
              title: Text("terms and conditions"),
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text("privacy policy"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("about us"),
            )
          ],
        )
      ],
  ),
),




body: Column(
children: const [
BannerCrousel()
],
),
);
}
}
