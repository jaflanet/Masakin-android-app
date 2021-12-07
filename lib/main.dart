import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masakin_app/pages/adminScreen/add_menu.dart';
import 'package:masakin_app/pages/adminScreen/add_restaurant.dart';
import 'package:masakin_app/pages/login_page.dart';
import 'package:masakin_app/pages/register_page.dart';
import 'package:masakin_app/pages/screen/section/restaurant_menu.dart';
import 'pages/main_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
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
        fontFamily: 'Montserrat',
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFF4B100)),
      ),
      home: MainPage(),
      routes: {
        '/loginPage': (context) => loginPage(),
        '/registerPage': (context) => registerPage(),
        '/mainPage': (context) => MainPage(),
        '/addMenu': (context) => addMenu(),
        '/addResto': (context) => addRestaurant(),
      },
    );
  }
}
