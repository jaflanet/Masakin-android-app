import 'package:flutter/material.dart';
import 'package:masakin_app/pages/adminScreen/addMenu.dart';
import 'package:masakin_app/pages/adminScreen/addRestaurant.dart';
import 'package:masakin_app/pages/login_page.dart';
import 'package:masakin_app/models/restaurant.dart';
import 'package:masakin_app/pages/register_page.dart';
import 'package:masakin_app/pages/screen/restaurantMenu.dart';
import 'package:masakin_app/pages/screen/section/restaurantInfo.dart';
import 'pages/main_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Masak.in',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDFBF2),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: loginPage(),
      home: restaurantMenu(),
      // home: addRestaurant(),
      // routes: {
      //   '/loginPage': (context) => loginPage(),
      //   '/registerPage': (context) => registerPage(),
      //   '/mainPage': (context) => MainPage(),
      //   '/addMenu': (context) => addMenu(),
      //   '/addResto': (context) => addRestaurant()
      // },
    );
  }
}
