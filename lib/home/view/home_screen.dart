import 'package:flutter/material.dart';
import 'Drawer_Widget.dart';
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
        title: Text(
          "welcome",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      drawer: customDrawer(context),
      body: Column(
        children: const [BannerCrousel()],
      ),
    );
  }
}
