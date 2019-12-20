import 'package:flutter/material.dart';
import 'package:hello_world/src/screens/profile_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  static String tag = 'main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Image.asset(
          'assets/accenture.png',
          fit: BoxFit.contain,
          height: 60,
        ),
        bottomOpacity: 1,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        key: Key('navBar'),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.purple,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text(
              'Home',
              key: Key('homeTab'),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text(
              'Profile',
              key: Key('profileTab'),
            ),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
