import 'package:flutter/material.dart';

class registerPage extends StatefulWidget {
  const registerPage({ Key? key }) : super(key: key);

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('register'),
      ),
    );
  }
}