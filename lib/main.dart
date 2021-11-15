import 'package:flutter/material.dart';
import 'package:masakin_app/pages/login_page.dart';
import 'package:masakin_app/pages/register_page.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masak.in',
      theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFDFBF2),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MainScreen(),
      home: loginPage(),
      routes: {
        '/loginPage':(context)=>loginPage(),
        '/register':(context)=>registerPage(),
        '/home':(context)=>MainScreen()
      },
    );
  }
}


