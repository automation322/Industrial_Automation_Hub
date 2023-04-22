import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cart/view/cart_screen.dart';
import '../../home/view/home_screen.dart';
import '../../settings/view/settings_screen.dart';
import '../../utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ThemeColors.Primarycolor,
        unselectedItemColor: ThemeColors.unselectediconcolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
