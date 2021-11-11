import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:masakin_app/navbar_key.dart';
import 'package:masakin_app/screen/account.dart';
import 'package:masakin_app/screen/history.dart';
import 'package:masakin_app/screen/home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;
  final screen = [HomeScreen(), HistoryScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Color(0xFFFDFBF2),
      color: Color(0xFFF5C901),
      index: selectedIndex,
      key: NavbarKey.getKey(),
      items: [
        Icon(
          Icons.home,
          size: 30,
        ),
        Icon(Icons.library_books, size: 30),
        Icon(
          Icons.person,
          size: 30,
        )
      ],
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    ),
    body: screen[selectedIndex],
    );
  }
}
