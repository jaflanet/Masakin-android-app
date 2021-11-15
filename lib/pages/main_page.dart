import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:masakin_app/navbar_key.dart';
import 'package:masakin_app/pages/screen/account.dart';
import 'package:masakin_app/pages/screen/history.dart';
import 'package:masakin_app/pages/screen/home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int selectedIndex = 0;
  final screen = [const HomeScreen(), const HistoryScreen(), const AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFBF2),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.contain,
          height: 90,
        ),
        toolbarHeight: 110,
        backgroundColor: Color(0xFFF5C901),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFFFDFBF2),
        color: Color(0xFFF5C901),
        animationDuration: Duration(milliseconds: 400),
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
