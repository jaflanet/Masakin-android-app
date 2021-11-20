import 'package:flutter/material.dart';

class addMenu extends StatelessWidget {
  const addMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       child: TextButton(
          child: const Text("back to add resto"),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/addResto');
          }),
    );
  }
}
