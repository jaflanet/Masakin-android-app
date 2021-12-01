import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:masakin_app/pages/screen/foodCart.dart';
import '../../widget/widgets.dart';
import 'package:masakin_app/navbar_key.dart';
import 'package:masakin_app/pages/screen/account.dart';
import 'package:masakin_app/pages/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String finalEmail;

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString('email'));
    if (sharedPreferences.getString('email') == null) {
      Navigator.pushReplacementNamed(context, '/loginPage');
    }
  }

  int selectedIndex = 0;
  final screen = [
    // const MenuScreen(),
    const HomeScreen(),
    DataFromAPI(),
    foodCart(),
    const AccountScreen()
  ];
  late double toolbarHeight;

  @override
  Widget build(BuildContext context) {
    // if (selectedIndex == 2) {
    //   toolbarHeight = 300;
    // } else {
    //   toolbarHeight = 110;
    // }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFDFBF2),
        bottomNavigationBar: CurvedNavigationBar(
          height: 65,
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
            Icon(Icons.add_shopping_cart, size: 30),
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
        body: SingleChildScrollView(
          child: Container(
            child: screen[selectedIndex],
          ),
        ),
      ),
    );
  }
}
