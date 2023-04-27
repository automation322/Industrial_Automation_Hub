import 'package:automation_hub/dashboard/controller/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../liked_products/view/liked_products_screen.dart';
import '../../orders/view/order_list_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Center(child: Text("your logo"))),
          ListTile(
            title: const Text("Orders"),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const OrderListScreen(),
            )),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LikedProductsScreen(),
            )),
            trailing: const Icon(Icons.chevron_right),
            title: const Text("Liked Products"),
          )
        ],
      ),
    );
  }
}
