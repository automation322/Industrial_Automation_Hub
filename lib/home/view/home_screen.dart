import 'package:automation_hub/utils/size_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'Drawer_Widget.dart';
import 'banner_Widget.dart';
import 'homepage_display_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              "Hi, ",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: Colors.grey, fontSize: 14),
            ),
            Text(
              FirebaseAuth.instance.currentUser?.displayName!.split(" ")[0] ??
                  "",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      drawer: customDrawer(context),
      body: Column(
        children: [
          const BannerCrousel(),
          const Text("Featured Product"),
          ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => const HomePageDisplayItem(
              productImagePath: "assets/images/image_1.jpg",
              productName: "product name",
              productPrice: "Rs. 200",
            ),
          )
        ],
      ),
    );
  }
}
