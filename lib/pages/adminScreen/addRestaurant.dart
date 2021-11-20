import 'package:flutter/material.dart';

class addRestaurant extends StatelessWidget {
  const addRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          child: const Text("add menu"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addMenu');
          }),
    );
  }
}
